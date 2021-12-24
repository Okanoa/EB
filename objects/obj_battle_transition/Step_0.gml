if (stage < 1 && counter == 0) {
	stage = 1;
	cam_instance.in_battle = false;
} else if(stage < 1) {
	counter--;
}
if instance_exists(obj_camera) {
	if(stage == 0 && cam_instance.in_battle == false) {
		swirl_x = camera_get_view_x(view_camera[0]);
		swirl_y = camera_get_view_y(view_camera[0]);
		stage = 0.5;
		swirl_instance = instance_create_layer(swirl_x, swirl_y, "Battle_Trans", obj_swirl);
		swirl_instance.layer = layer_get_id("Battle_Trans");
		swirl_instance.image_alpha = 0.8;
		cam_instance.in_battle = true;
	}
}
if(stage == 1) { //Time to fade to black
	//set depth to cover everything for fade to black
	depth = -15000
	if alpha < 1 {
	   alpha += 1/fadeTime; // alpha will reach 1 at set fade time
	   if alpha >= 1 {
			stage = 2;
			instance_deactivate_object(player);
			instance_destroy(swirl_instance);
			room_goto(rm_battle);
			visible = false;
	   }
	}
}
else if(stage == 2) {
	alpha = 0
	if(room == rm_battle) {
		stage = 2.5;
	}

}
else if(stage == 2.5 && room == global.current_room) {
	stage = 3;
	alpha = 1;
	instance_activate_object(player);
	player.movement_state = MovementStates.normal;
	player.invulnerable_timer = 120;
	cam_instance.in_battle = false;
}
else if(stage == 3) { //Time to fade back to the camera
	play_room_music();
	scr_clear_defeated();
	instance_destroy();
}
