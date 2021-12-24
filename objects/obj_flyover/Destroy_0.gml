/// @description Insert description here
// You can write your code in this editor
if(pause_player_movement) {
	with(instance_find(obj_player, 0)) {
		move_speed = global.walk_speed;
		run_move_speed = global.run_speed;
	}
}