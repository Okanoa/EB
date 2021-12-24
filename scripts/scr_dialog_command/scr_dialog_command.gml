/// @description Run commands that are in the command_map
/// @param event_command

var event_command = argument[0]
var command_delimiter = ":";
var parameter_delimiter = ";";
var core_command = "";
var parameters = ds_list_create();
var parameters_count = 0;

if(string_count(command_delimiter, event_command) > 0)
{
	var split_command = scr_split_string(event_command, command_delimiter)
	core_command = ds_list_find_value(split_command, 0);
	parameters = scr_split_string(ds_list_find_value(split_command, 1), parameter_delimiter);
	parameters_count = ds_list_size(parameters);
}
else
{
	core_command = event_command
}

switch(core_command) {
	case "pause":
		pause_timer = 60;
		if(ds_list_size(parameters) > 0) {
			pause_timer = real(ds_list_find_value(parameters, 0));
		}
		temp_speed = msg_speed;
		msg_speed = 0;
		break;
	case "hide_dialog": // Hides the dialog window, but the window continues to work. Good for hiding it while executing commands
		with instance_find(obj_dialogue_system, 0) visible = false;
		break;
	case "show_dialog": // Brings the dialog back
		with instance_find(obj_dialogue_system, 0) visible = true;
		break;
	case "auto_advance": // Once the window hits the end of the current line it doesn't want for the player to press a button and continues
		with instance_find(obj_dialogue_system, 0) auto_advance = true;
		break;
	case "prompt": // Waits for input from the player, just like it does when hitting the end of a line, but this does it anywhere
		temp_speed = msg_speed;
		msg_speed = 0;
		show_prompt = true;
		break;
	case "shake": //shake(duration, force)
		var duration = 5;
		var force = 1;
		if(ds_list_size(parameters) >= 2) {
			duration = ds_list_find_value(parameters, 0);
			force = ds_list_find_value(parameters, 1);
		}
		with instance_find(obj_camera, 0) {
			shake = true;
			shake_duration = real(duration);
			shake_force = real(force);
			scr_track_player(false);
		}
		break;
	case "sound": //sound(sound_effect_asset_name)
		if(ds_list_size(parameters) > 0) {
			var sound_name = ds_list_find_value(parameters, 0);
			var sound_effect = asset_get_index(sound_name);
			audio_play_sound(sound_effect, 10, false);
		}
		
		break;
	case "pan": //pan(duration, start_x, start_y, end_x, end_y)
		if(ds_list_size(parameters) >= 5) {
			var duration = real(ds_list_find_value(parameters, 0));
			var start_x = real(ds_list_find_value(parameters, 1));
			var start_y = real(ds_list_find_value(parameters, 2));
			var end_x = real(ds_list_find_value(parameters, 3));
			var end_y = real(ds_list_find_value(parameters, 4));
			
			var x_step = (end_x - start_x) / duration;
			var y_step = (end_y - start_y) / duration;
			
			scr_track_player(false);
			camera_set_view_pos(view_camera[0], start_x, start_y);
			
			with instance_find(obj_camera, 0) {
				pan = true;
				camera_pan_duration = duration;
				pan_x_step = x_step;
				pan_y_step = y_step;
			}
		}
		
		break;
	case "look_at": //look_at(duration, x, y)
		if(ds_list_size(parameters) >= 3) {
			var duration = real(ds_list_find_value(parameters, 0));
			var start_x = real(ds_list_find_value(parameters, 1));
			var start_y = real(ds_list_find_value(parameters, 2));
			scr_track_player(false);

			camera_set_view_pos(view_camera[0], start_x, start_y);
			with instance_find(obj_camera, 0) {
				look_duration = duration;
			}
		}
		break;
	case "kill_dialog":
		instance_destroy(instance_find(obj_dialogue_system, 0));
		break;
	case "flyover":
		var text_duration = 180;
		var fade_duration = room_speed;
		var move_x = -1;
		var move_y = -1;
		var fly_text = ds_list_find_value(parameters, 0);
		if (parameters_count > 1) var text_duration = real(ds_list_find_value(parameters, 1)) else var text_duration = 5;
		if (parameters_count > 2) var fade_duration = real(ds_list_find_value(parameters, 2)) else var fade_duration = 12;
		if (parameters_count > 3) var move_x = real(ds_list_find_value(parameters, 3)) else var move_x = 0;
		if (parameters_count > 4) var move_y = real(ds_list_find_value(parameters, 4)) else var move_y = 0;
		if (parameters_count > 5) var room_target = real(ds_list_find_value(parameters, 5)) else var room_target = "";
		if (parameters_count > 6) var facing = real(ds_list_find_value(parameters, 6)) else var facing = -1;
		if (parameters_count > 7) var close_sound = asset_get_index(ds_list_find_value(parameters, 7)) else var close_sound = noone;

		with instance_create_depth(0,0,-15000,obj_flyover) {
			flyover_text = fly_text;
			stage = 1;
			text_frames = text_duration;
			fadeTime = fade_duration;
			move_target_x = move_x;
			move_target_y = move_y;
			target_room = room_target;
			face_direction = facing;
			door_close_sound = close_sound;
		}
		break;
	case "stop_player_follow":
		scr_track_player(false, true);
		break;
	case "start_player_follow":
		scr_track_player(true, false);
		break;
	case "move": //move:object;x_direction,y_direction,time,speed,index(optional)
		if(ds_list_size(parameters) >= 5) {
			var x_dir = real(ds_list_find_value(parameters, 1));
			var y_dir = real(ds_list_find_value(parameters, 2));
			var time = real(ds_list_find_value(parameters, 3));
			var mov_speed = real(ds_list_find_value(parameters, 4));
			if (ds_list_size(parameters) >= 6) var index = ds_list_find_value(parameters, 5) else var index = 0;
			
			with instance_create_depth(0,0,0,movement_handler) {
				move_time = time;
				move_x_dir = x_dir;
				move_y_dir = y_dir;
				move_speed = mov_speed;
				move_target = instance_find(asset_get_index(ds_list_find_value(parameters, 0)), index);
			}
		}
		break;
	case "move_loc": //move_loc:object;target_x,target_y,speed,final_direction,index(optional)
		if(ds_list_size(parameters) >= 5) {
			var x_target = real(ds_list_find_value(parameters, 1));
			var y_target = real(ds_list_find_value(parameters, 2));
			var mov_speed = real(ds_list_find_value(parameters, 3));
			var final_dir = real(ds_list_find_value(parameters, 4))
			if (ds_list_size(parameters) >= 6) var index = ds_list_find_value(parameters, 5) else var index = 0;
			
			with instance_create_depth(0,0,0,movement_handler) {
				target_x = x_target;
				target_y = y_target;
				move_speed = mov_speed;
				move_target = instance_find(asset_get_index(ds_list_find_value(parameters, 0)), index);
				final_direction = final_dir;
				move_location = true;
			}
		}
		break;
	case "face": //face:object;face_direction;index
		if(ds_list_size(parameters) >= 2) {
			var face_dir = real(ds_list_find_value(parameters, 1));
			if (ds_list_size(parameters) >= 3) var index = ds_list_find_value(parameters, 2) else var index = 0;
			
			with instance_find(asset_get_index(ds_list_find_value(parameters, 0)), index) {
				dir = face_dir;
			}
		}
		break;
	case "script_command": //script_command:script_name;arg0;arg1;...
		if(ds_list_size(parameters) > 0) {
			var inp_list = []
			for (var i = 0; i < ds_list_size(parameters); i++)
			{
				inp_list[i] = ds_list_find_value(parameters, i);

			}
			inp_list[0] = asset_get_index(inp_list[0])
			scr_execute_array(inp_list);
		}
		
		break;
	case "trigger_beat": //trigger_beat
		var bat_man = instance_find(obj_battle_manager, 0);
		
		if(bat_man != noone) 
		{
			bat_man.beat_active = 1;
			scr_make_active_ui(bat_man);
		}
		
		break;
	case "enemy_flash": //enemy_flash:enemy_index;color(optional)
		if(instance_exists(obj_battle_manager)) {
			var enm_index = real(ds_list_find_value(parameters, 0));
			if (ds_list_size(parameters) >= 2) var color = ds_list_find_value(parameters, 1) else var color = "white";
			with(instance_find(obj_battle_manager, 0))
			{
				enemy_flash = enm_index;
				switch(color) {
					case "black":
						flash_color = c_black;
						break;
					case "white":
						flash_color = c_white;
						break;
					case "green":
						flash_color = c_green;
						break;
					case "yellow":
						flash_color = c_yellow;
						break;
					case "red":
						flash_color = c_red;
						break;
					case "blue":
						flash_color = c_blue;
						break;
				}
			}
		}
		break;
	case "custom_animation": //custom_animation:npcID;sprite_name;anim_speed;number_of_loops
		// Use the npcID for the NPC, or "player" for the player (TODO support player default names, like Ness, Paula, etc)
		var inst = ds_list_find_value(parameters, 0);
		var sprite_id = asset_get_index(ds_list_find_value(parameters, 1));
		var anim_speed = real(ds_list_find_value(parameters, 2));
		if (ds_list_size(parameters) >= 4) var loop = real(ds_list_find_value(parameters, 3)) else var loop = 0;
		
		with(scr_find_npc_id(inst)) {
			movement_state = MovementStates.custom_animation;
			current_sprite_index = sprite_id;
			image_index = 0;
			image_speed = anim_speed;
			custom_animation_loops = loop;
		}
		break;
}