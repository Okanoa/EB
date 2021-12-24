/// @draw dialogue
///@param dialogue
///@param x
///@param y
///@param width
///@param height
///@param lines

if(instance_exists(obj_dialogue_system)) {
	show_debug_message("Can't make more than 1 dialogue")	
} else {
		
		with(instance_create_depth(0,0,-10000,obj_dialogue_system)) {
				dialogue = argument[0];
				letterbox = false;
				anim_offset = -61;
				anim_target = -61;
				anim_approach = 0;
				enter_speed = 4*2;
				exit_speed = 3*2;
				if(argument_count > 1) control = argument[1]; else control = false;
				if(argument_count > 2) x_ = argument[2]; else x_ = 64; //17 is the standard indent for a line
				if(argument_count > 3) y_ = argument[3]; else y_ = 7;
				if(argument_count > 4) width = argument[4]; else width = 257; //231 is the standard window size
				if(argument_count > 5) height = argument[5]; else height = 61-17; //61 is the standard window size (65 - 4)
				if(argument_count > 6) lines = argument[6]; else lines = 2; //usually we only do 2 lines
				if(argument_count > 7) pixels_between_lines = argument[7]; else pixels_between_lines = 14; //we want 6 pixels between lines usually
				event_user(0);
		}
}