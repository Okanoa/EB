/// @Resolution options and fixing

camera_set_view_size(view,global.width,global.height)

//fix the resolution if not in full and not correct.
if (window_get_height() != global.height*global.zoom
    || window_get_width() != global.width*global.zoom)
	&& !window_get_fullscreen()
{
    window_set_size(global.width*global.zoom, global.height*global.zoom);
    surface_resize(application_surface, global.width, global.height);
    display_reset(0,true);
	
    display_set_gui_size(global.width/2,global.height/2);
}

//custom resolutions

//fullscreen
if(keyboard_check_pressed(vk_f4)) {
    window_set_fullscreen(!window_get_fullscreen());
}
//resolution scale
if(keyboard_check_pressed(vk_f3)) {
    global.zoom++;
    if(global.zoom > 4) {
        global.zoom = 1;
    }
}

//shake the screen
if(shake){
    shake_duration--;
	if(original_x == noone) {
		original_x = camera_get_view_x(view_camera[0]);
		original_y = camera_get_view_y(view_camera[0]);
	}
    var new_x_position = camera_get_view_x(view_camera[0]) + random_range(-shake_force,shake_force);
    var new_y_position = camera_get_view_y(view_camera[0]) + random_range(-shake_force,shake_force);
	
	camera_set_view_pos(view_camera[0], new_x_position, new_y_position);
	
	if(shake_duration <= 0){
        shake = false;
		if(!scr_get_track_player_lock() && !instance_exists(obj_battle_manager))
		{
			scr_track_player(true);
		} else if(instance_exists(obj_battle_manager)) {
			camera_set_view_pos(view_camera[0], original_x, original_y);
			original_x = noone;
			original_y = noone;
		}
    }
}

// pan the camera
if(camera_pan_duration > 0) && (pan) {
	camera_pan_duration--;

	var new_x_position = camera_get_view_x(view_camera[0]) + pan_x_step;
    var new_y_position = camera_get_view_y(view_camera[0]) + pan_y_step;
	
	camera_set_view_pos(view_camera[0], new_x_position, new_y_position);
	
	if(camera_pan_duration <= 0){
        pan = false;
		if(!scr_get_track_player_lock())	
			scr_track_player(true);
    }
}

// look at coordinates in room
if(look_duration > 0) {
	look_duration--;
	if(look_duration <= 0){
		if(!scr_get_track_player_lock())	
			scr_track_player(true);
    }
}

//end the game if requested
if(keyboard_check_pressed(vk_escape)) {
    game_end();
}

//restart the game if requested
if(keyboard_check_pressed(vk_f5)) {
    game_restart();
}

//enable_zsort()