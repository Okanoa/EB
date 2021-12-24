/// @description Perform actions and turns
event_inherited();

//manage turns
var enm = global.enemies;
var dialogue_exists = instance_exists(obj_dialogue_system);

if !dialogue_exists && turn == 2 {
	for(var k = 0; k < 4; k++) {
		status_target[k] = status_hide;
	}
	turn = 0;
	player_choose = 0;
	current_player = 0;
	ds_list_clear(player_actions);
	ds_list_clear(player_priorities);
}
if turn == 0 {
	if(current_player == player_choose && current_player < ds_list_size(global.party)) {
		var this_manager = self;
		with(instance_create_depth(global.width/2, 11, 0, obj_battle_menu)) {
			battle_manager = this_manager;
		}
		status_target[current_player] = status_peek;
		player_choose++;
	}
	if(current_player >= ds_list_size(global.party)){
		turn = 1;
		current_player = 0;
		player_choose = 0;
	}
}
if turn == 1 && !dialogue_exists{
	for(var k = 0; k < 4; k++) {
		status_target[k] = status_hide;
	}
	turn = 2;
	var bat_msg = scr_create_dialogue();
	for (var e = 0; e < ds_list_size(enm); e++)
	{
		var enemy = enm[| e]
		ds_map_set(enemy, "index", e);
		var att_spd = ds_map_find_value(enemy, "speed");
		
		// get the possible attacks and figure out which the enemy will execute this round
		var attacks = ds_map_find_value(global.enemies[| e], "attacks");
		var attack_rng = irandom(100);
		var final_text = noone;
		var sorted_abilities = ds_priority_create();
		
		for (var key = ds_map_find_first(attacks); !is_undefined(key); key = ds_map_find_next(attacks, key)) {
			var value = attacks[? key];
			ds_priority_add(sorted_abilities, key, value);
		}
		
		for (var key = ds_priority_find_min(sorted_abilities); !is_undefined(key); key = ds_priority_find_min(sorted_abilities)) {
			var value = ds_priority_find_priority(sorted_abilities, key);
			ds_priority_delete_value(sorted_abilities, key);
			if(attack_rng < value)
			{
				var ability = ds_map_find_value(global.ability_data, key);
				final_text = scr_process_ability(enemy, ds_map_find_value(ability, "ability_type"), ds_map_find_value(ability, "text"), scr_player_to_map(0));
				break;
			}
		}
		
		ds_priority_destroy(sorted_abilities);
		
		// Take the final text for the ability and add it to the battle text
		if (final_text != noone) {
			var priority_val = ds_list_size(final_text);
		
			for (var k = 0; k < ds_list_size(final_text); k++)
			{
				// This will likely lead to issues with lines getting intermingled with multiple enemies of different types, gotta find a better way
				scr_add_dialogue(bat_msg, final_text[| k], att_spd * 1000 + e * 100 + priority_val);
				priority_val--;
			}
		}

	}
	
	//Merge player and enemy actions
	for (var p = 0; p < ds_list_size(player_actions); p++) {
		scr_add_dialogue(bat_msg, player_actions[| p], player_priorities[| p]);
	}
	
	scr_play_dialogue_bat(bat_msg);
}

if global.combat_won {
	turn = 3;
}

if turn = 3 && !dialogue_exists {
	//run();
	var win_msg = scr_create_dialogue();
	scr_add_dialogue(win_msg, "@show_win", 2);
	scr_add_dialogue(win_msg, "@Ness earned experience points.", 1);
	scr_add_dialogue(win_msg, " {script_command:run;0}",0)
	
	scr_play_dialogue_bat(win_msg);
	
	show_debug_message("WHY ARE YOU RUNNING");
}

//HP stuff
var stats = global.stats; //shorten for ease

var i;

for(i = 0; i < 4; i++) { //loop through hp and and preform counting down
	
	status_current[i] = scr_approach(status_current[i], status_target[i], 2);
	
	if(stats[# i, 0] = true) { //check if active party member
		stats[# i, 2] = clamp(stats[# i, 2],0,stats[# i, 1]); //clamp hpgoal
		stats[# i, 5] = clamp(stats[# i, 5],0,stats[# i, 4]); //clamp ppgoal
		
		stats[# i, 3] = scr_approach(stats[# i, 3], stats[# i, 2], 1/8);
		stats[# i, 6] = scr_approach(stats[# i, 6], stats[# i, 5], 1/8);
		
	}
	
}

// Check if any of the players should be showing for their turn execution
if(dialogue_exists) {
	var dsys = instance_find(obj_dialogue_system, 0);
	if(!scr_get_active_ui() == dsys)
		scr_make_active_ui(dsys);
	var dsys_current_message = dsys.raw_string;
	var player_active = false;
	for (var p = 0; p < ds_list_size(player_actions); p++) {
		if(ds_list_find_value(player_actions, p) == dsys_current_message) {
			player_active = true;
			beat_player = p;
			status_target[player_instigator[| p]] = status_peek;
			for(var n = 0; n <= array_length_1d(status_target); n++) {
				if(n != player_instigator[| p]) {
					status_taret[n] = status_hide;
				}
			}
			break;
		}
	}
	if(!player_active) {
		for(var k = 0; k < 4; k++) {
			status_target[k] = status_hide;
		}
	}
}

// BPM/Combo stuff
beat_timer += delta_time;

if(beat_timer >= beat_interval) {
	if(play_beat)
		audio_play_sound(snd_menu1, 100, 0);
	beat_timer = beat_interval - beat_timer;
}

// Is it time to start combos?
if(beat_active == 1) {
	// beat_active is set when trigger_beat is called in the ability text
	// we create a beat_handler to handle the input from the player
	if(!instance_exists(obj_beat_handler))
	{
		beat_handler = instance_create_depth(0, 0, 0, obj_beat_handler);
		beat_handler.battle_manager = self;
		total_damage = 0;
	} else if(scr_get_active_ui() != beat_handler) {
		scr_make_active_ui(beat_handler);
	}
	
	// We watch for the player input via beat_input, and we start the combo counter once the player hits their first beat
	if(beat_input > 0 && (beat_timer > beat_interval - beat_tolerance || beat_timer < beat_tolerance)) {
		// If the player hits the first beat correctly, we move on to the next phase
		combo_count = 1;
		beat_active = 2;
		beat_damage = global.stats[# beat_player, 9];
		beat_hit = true;
	} else if(beat_input > 0) {
		// The player didn't start their input on a beat, so just do the base damage and wrap things up
		scr_stop_beat();
		beat_damage = global.stats[# beat_player, 9];
		beat_hit = true;
	}
} else if(beat_active == 2) {
	// In this phase we watch to see when we've entered the beginning of the correct beat input time
	if(beat_timer > beat_interval - beat_tolerance) {
		// Once it is time for the player to hit the next beat, we go into phase 3
		beat_active = 3;
	}
}

if(beat_active == 3) {
	// In phase 3, the player has a small window of time to hit the input button and land a beat combo
	if(beat_timer < beat_interval - beat_tolerance && beat_timer > beat_tolerance) {
		//In this case, the player missed the beat, so we wrap things up and display the total damage
		//TODO Display total damage
		scr_stop_beat();
	} else if(beat_input > 0) {
		var base_damage = global.stats[# beat_player, 9];
		//In this case the player hit the beat and we increment their combos and check if they've hit 16
		if(beat_notes == noone) {
			var enm_map = enm[| beat_target];
			beat_notes = instance_create_depth(ds_map_find_value(enm_map, "xpos"), ds_map_find_value(enm_map, "ypos"), 0, obj_notes);
		}
		beat_hit = true;
		beat_damage = round(random_range((0.1 * base_damage),(0.3 * base_damage)));
		beat_active = 2;
		combo_count++;
		if(combo_count == combo_max) {
			//WOOHOO!
			//TODO Play cheer sound
			scr_stop_beat();
		}
	}
}

// If any of the above code decides the player landed a hit, we process that here
if(beat_hit) {
	if(beat_notes != noone) {
		beat_notes.count = combo_count;
	}
	scr_damage_enemy(beat_target, beat_damage);
	total_damage += beat_damage;
	beat_hit = false;
	beat_input = 0;
}

// Cancel enemy selection
if(scr_get_active_ui() == self && cancel_press) {
	scr_make_active_ui(instance_find(obj_battle_menu, 0));
}