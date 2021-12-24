/// @description Insert description here
// You can write your code in this editor
if knocking_timer > 0 && knocking {
	knocking_timer--;
	if knocking_timer <= 0 {
		event_user(0);
	}
}