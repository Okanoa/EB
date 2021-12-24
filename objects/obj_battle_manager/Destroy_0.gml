/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ds_list_destroy(player_priorities);
ds_list_destroy(player_actions);
ds_list_destroy(player_instigator);
ds_list_destroy(enemy_states);
ds_list_clear(global.enemies);