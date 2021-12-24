/// @description Insert description here
// You can write your code in this editor
value = ds_priority_delete_max(dialogue);
raw_string = value;
if(!is_undefined(value) && value != 0) value = scr_replace_commands(value);
ds_map_clear(command_map);
if(!is_undefined(value) && value != 0) command_map = scr_map_commands(value, msg_prog, command_map);
if(is_string(value)) {
	value = scr_strip_commands(value);
} else {
	active = false;	
}
tpos = 21
t = true;
if(value == "0" || value == 0 || is_undefined(value) || !is_string(value)){
	active = false;
} else if(string_copy(value,1,8) = "@newbox:") {
	//if(string_copy(value,8,string_length(value)-8)) {
		name = string_copy(value,9,string_length(value)-8)
	//}
	msg_prog = 0;
	current_message = "";
	event_user(0);
	
} else if(string_copy(value,1,8) = "@prompt:") {
	
	var yespos = string_pos(":",value);
	var nopos = string_pos(";",value);
	var yesp = string_pos("&",value);
	var nop = string_pos("%",value);
	
	yesval = string_copy(value,yespos+1,nopos-(yespos)-1)
	noval = string_copy(value,nopos+1,yesp-(nopos)-1)
	yes = string_copy(value,yesp+1,nop-(yesp)-1)
	no = string_copy(value,nop+1,string_length(value)-(nop))
	
	current_message += "";

} else if(string_copy(value,1,9) = "@show_win") {
	msg_prog = 0;
	current_message = "";
} else {
//add the message if not command
	if(string_copy(value,string_length(value)-1,2) = "%n") {
		current_message += string_copy(value,1,string_length(value)-2)+"\n";
		event_user(0);
	} else if(is_string(value)){
		current_message += value+"\n";
	}
}

processing_commands = false;
pause_timer = 0;
show_prompt = false;