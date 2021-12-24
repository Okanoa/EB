persistent = true;

alpha = 0;
text_alpha = 0;
fadeTime = room_speed;
// stages are: 1-fade to black, 2-Fade In Text, 3-Show Text, 4-Fade out text, 5-Move Player (optional), 6-Fade to camera
stage = 0;
text_frames=0;
flyover_text = "";

pause_player_movement = true;

target_room = ""
move_target_x = -1;
move_target_y = -1;
face_direction = -1;

played_close = false;
door_close_sound = noone;

if(pause_player_movement) {
	with(instance_find(obj_player, 0)) {
		move_speed = 0;
		run_move_speed = 0;
	}
}