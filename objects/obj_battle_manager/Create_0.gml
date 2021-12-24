/// @description Init stats and enemies
event_inherited();
// enemy data
// turn data if true its our turn

enemy_sort = ds_priority_create();

turn = 2; //0 - 2 is it our turn to choose or is the battle taking place 0 = choose 1 = enem choose 2 = play fight
player_choose = 0; // 0 - 3
current_player = 0;
enemy_positions = ds_list_create();
current_action = "";
player_actions = ds_list_create();
player_priorities = ds_list_create();
player_instigator = ds_list_create();
status_peek = 167;
status_hide = 197;
status_target[3] = 197;
status_current[3] = 197;
status_current[0] = 197;
status_current[1] = 197;
status_current[2] = 197;

for (var e = 0; e < ds_list_size(global.enemies); e++)
{
	// Set up quick data arrays for each enemy: index 0 is battle sprite index, index 1 is x position, index 2 is y position, index 3 is rotation
	var sprite_indx = ds_map_find_value(global.enemies[| e], "battle_sprite_index")
	ds_list_add(enemy_positions, [real(sprite_indx), 0, 0, 0]);
}
wob = 0;
wibble = 0;
cursorloc = 95;
has_cursor = true;
close_with_cancel_button = false;
enemy_count = ds_list_size(global.enemies);
enemy_scroll = 3;
// Stuff for making an enemy flash when attacking
enemy_flash = -1;
flash_step = 0.1;
flash_counter = 2;
flash_color = c_white;
alpha_flash = 0;

e_wait = 0;
max_selection = enemy_count;
cursor_actions = ds_list_create();
enemy_states = ds_list_create();
var i;
for (i = 0; i < enemy_count; i++) {
	var adjusted_enemy = global.enemies[| i];
	ds_list_add(cursor_actions, "select_target");
	ds_list_add(enemy_states, ds_list_find_value(global.enemies, i));
	ds_map_set(adjusted_enemy, "current_hp", ds_map_find_value(adjusted_enemy, "hp"));
	ds_map_set(adjusted_enemy, "current_pp", ds_map_find_value(adjusted_enemy, "pp"));
	ds_map_set(adjusted_enemy, "index", i);
}
var initaltxt = ds_priority_create();
var initial_enemy = global.enemies[| 0];
var initial_enemy_name = ds_map_find_value(initial_enemy, "name");


beat_interval = 60000000 / real(ds_map_find_value(initial_enemy, "beats_per_minute"));
beat_timer = 0;
beat_tolerance = beat_interval * 0.3;
combo_count = 0;
combo_max = 16;
total_damage = 0;
display_count = 0;
display_damage = 0;
// If this is true, play the "heartbeat" sound
play_beat = true;
// If this is set to 1 wait for the player to hit a key to start combos
// If this is set to 2 the player must sustain the beat
beat_active = 0;
// Input handler that gets inputs via obj_beat_handler
beat_input = 0;
beat_handler = noone;
beat_damage = 0;
beat_hit = false;
beat_target = -1;
beat_player = -1;
beat_notes = noone;
damage_display_time = 100;
damage_display_timer = 0;
dialog_return_point = 80;

if ds_list_size(global.enemies) <= 1 {
	var possible_strings = ds_map_find_value(global.battle_strings, "single_encounter");
} else {
	var possible_strings = ds_map_find_value(global.battle_strings, "multi_encounter");
}
var random_index = irandom_range(0, ds_list_size(possible_strings) - 1);
scr_add_dialogue(initaltxt, scr_encounter_string(initial_enemy, ds_list_find_value(possible_strings, random_index)));

beat_interval = 60000000 / ds_map_find_value(initial_enemy, "beats_per_minute");
beat_timer = 0;

scr_play_dialogue_bat(initaltxt);