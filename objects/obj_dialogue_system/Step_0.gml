event_inherited();
/// @description Insert description here
// You can write your code in this editor

// Check for commands to run
if(ds_map_size(command_map) > 0) && (ds_map_exists(command_map, floor(msg_prog)) && pause_timer <= 0 && !show_prompt) {
	var command_list = ds_map_find_value(command_map, floor(msg_prog));
	var list_size = ds_list_size(command_list);
	if list_size > 0 processing_commands = true else processing_commands = false;
	if(processing_commands) {
		scr_dialog_command(ds_list_find_value(command_list, 0));
		ds_list_delete(command_list, 0);
	} else {
		ds_map_delete(command_map, floor(msg_prog));
	}
}

// Check if we are still active, and if we're not animate the dialog box away before destroying
if(active == true) {
	anim_approach= scr_approach(anim_approach,-90, enter_speed);
	//anim_offset+= ((0 -anim_offset) * .2);
	anim_offset= lengthdir_x(anim_target,anim_approach);
} else {
	anim_approach= scr_approach(anim_approach,0, exit_speed)
	global.ui_active = false;
	//anim_offset+= ((anim_target-anim_offset) * .1);
	anim_offset= lengthdir_x(anim_target,anim_approach);
	if( (anim_offset) = anim_target) instance_destroy();
}

halt--;

// If the pause command was invoked, wait some time before continuing to write text
if(pause_timer > 0) {
	pause_timer--;
} else if(msg_speed <= 0) {
	msg_speed = temp_speed;
}

// Trigger the talk animation for the character talking
if (global.talking_npc != noone && global.talking_npc.object_index == obj_npc) {
	if(msg_prog < string_length(current_message) && global.talking_npc.movement_state != MovementStates.talking) {
		global.talking_npc.movement_state = MovementStates.talking;
	} else if (msg_prog >= string_length(current_message) && global.talking_npc.movement_state == MovementStates.talking) {
		global.talking_npc.movement_state = MovementStates.normal;
	}
}

// Wait for a button press if we've hit the prompt
if((action_press || accept_press || auto_advance) && halt < 0 && (msg_prog >= string_length(current_message) || show_prompt)) {
	if(!is_undefined(value)) {
		if(string_copy(value,1,8) == "@prompt:") {
			scr_run_command(yesval,noval,t);
			event_user(0);
		} else {
			if(msg_prog >= string_length(current_message))
				event_user(0);
		}
	}
	if(show_prompt) {
		msg_speed = temp_speed;
		show_prompt = false;
	}
	auto_advance = false;
// Speed up the text draw speed if the correct button is being pressed
} else if(action_key && pause_timer <= 0 && !show_prompt && !instance_exists(obj_beat_handler)) {
	msg_prog+=msg_speed;
}

// Start the text over (at least comment this out before releasing anything)
if(keyboard_check_pressed(ord("R"))) {
	msg_prog = 0;	
}

// Add to the message progress
if(!processing_commands && !instance_exists(obj_beat_handler))
{
	msg_prog+=msg_speed;
	msg_prog = clamp(msg_prog,0,string_length(current_message)+1);
}

if name!=""{
// If there is no name tag, don't play text blip sounds
	if ~~msg_prog > ~~txt_sound_wait
	{
		var usfx = audio_play_sound(snd_textblip,10,false);
		var val = .90;
		audio_sound_pitch(usfx,val+random_range(0,.1));
	}
}

txt_sound_wait = msg_prog;