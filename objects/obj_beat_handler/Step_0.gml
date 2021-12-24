/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(battle_manager != noone) {
	if(accept_press > 0) {
		battle_manager.beat_input = 1;
	} else {
		battle_manager.beat_input = 0;
	}
}
