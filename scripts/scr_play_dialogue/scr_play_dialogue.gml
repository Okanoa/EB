/// @draw dialogue
///@param dialogue
///@param x
///@param y
///@param width
///@param height
///@param lines
var jkey = ""
if(npcID != undefined){
     jkey = npcID;
}

if(instance_exists(obj_dialogue_system)) {
	show_debug_message("Can't make more than 1 dialogue")	
} else {
		with(instance_create_depth(0,0,-10000,obj_dialogue_system)) {
				dialogue = argument[0];
				jsonkey = jkey;
				if(argument_count > 1) x_ = argument[1]; else x_ = 17; //17 is the standard indent for a line
				if(argument_count > 2) y_ = argument[2]; else y_ = global.height - 65;
				if(argument_count > 3) width = argument[3]; else width = 231; //231 is the standard window size
				if(argument_count > 4) height = argument[4]; else height = 61; //61 is the standard window size (65 - 4)
				if(argument_count > 5) lines = argument[5]; else lines = 3; //usually we only do 3 lines
				if(argument_count > 6) pixels_between_lines = argument[6]; else pixels_between_lines = 14; //we want 6 pixels between lines usually
				event_user(0);
		}
}