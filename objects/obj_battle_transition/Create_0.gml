audio_stop_all();
if (isABoss == true) {
	audio_play_sound(snd_oncomingboss, 10, false);
} else if (isABoss == false){
	audio_play_sound(snd_oncomingfoe, 10, false);
}

counter = 160;

alpha = 0;
fadeTime = room_speed;
// stages are: 0-swirl, 1-fade to black, 2-Fade to camera
stage = 0;

swirl_instance = 0;

cam_instance = instance_find(obj_camera, 0);

with(instance_find(obj_player, 0)) {
	global.current_x = x;
	global.current_y = y;
	global.current_room = room;
}

player = instance_find(obj_player, 0);