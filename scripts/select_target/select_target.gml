var ability = ds_map_find_value(global.ability_data, "player_attack01");	
var att_spd = global.stats[# current_player, 11];
var attack_text = scr_process_ability(scr_player_to_map(current_player), ds_map_find_value(ability, "ability_type"), ds_map_find_value(ability, "text"), ds_list_find_value(global.enemies, selected));
if (attack_text != noone) {
	var priority_val = ds_list_size(attack_text);
		
	for (var k = 0; k < ds_list_size(attack_text); k++)
	{
		ds_list_add(player_instigator, current_player);
		ds_list_add(player_actions, attack_text[| k]);
		ds_list_add(player_priorities, att_spd * 1000 + (current_player + 8) * 100 + priority_val);
		priority_val--;
	}
}
status_target[current_player] = status_hide;
current_player++;
status_target[current_player] = status_peek;

beat_target = selected;

selection_made = true;
instance_destroy(instance_find(obj_battle_menu, 0));