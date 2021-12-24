if (keyboard_check_pressed(vk_down)){ selected++; audio_play_sound(snd_menu1,10,false); }
if (keyboard_check_pressed(vk_up)){ selected--; audio_play_sound(snd_menu1,10,false);}
if (selected == 3) { selected = 0; }
if (selected == -1) { selected = 2; }

if (selected == 0) {
	menu_text = "New Game"
} else if (selected == 1) {
	menu_text = "Load Game"
} else if (selected == 2) {
	menu_text = "Options"
}

if (keyboard_check_pressed(vk_enter)) || (keyboard_check(global.action_button)) {
	if (selected == 0) {
		audio_stop_all();
		room_goto(rm_onett);
	}
	if (selected = 2) {
		instance_create_depth(x,y,-1,obj_optionmenu);
		instance_destroy();
	}
}