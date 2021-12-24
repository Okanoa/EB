/// @description Insert description here
// You can write your code in this editor

collider = other;
knocking = true;
var knock_time = 68;
knocking_timer = knock_time;
with(instance_find(obj_camera, 0)) {
	track_player = false;
}
with(other.id) {
	knocking_timer = knock_time;
	image_index = 0;
	movement_state = MovementStates.knocking;
}