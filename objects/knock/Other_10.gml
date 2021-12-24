/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if knocking && knocking_timer <= 0 {
	knocking = false;
	event_inherited();
}
