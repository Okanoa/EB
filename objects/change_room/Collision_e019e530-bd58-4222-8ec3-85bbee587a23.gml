if(triggered == false){
	with(other) {
		move_paused = true;
	}
	triggered = true;
	if(!variable_instance_exists(id, "facing")) {
		facing = obj_player.dir;
	}
	if (door_open_sound != noone) {
		audio_play_sound(door_open_sound, 10, false);
	}
	var flyover_string = "flyover:  ;0;12;" + string(targetX) + ";" + string(targetY) + ";" + string(target_room) + ";" + string(facing);
	if(door_close_sound != noone)
		flyover_string = flyover_string + ";" + object_get_name(door_close_sound);
	scr_dialog_command(flyover_string);
}
