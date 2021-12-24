depth = -15000

if(stage == 1) { //Time to fade to black
	if alpha < 1 {
	   alpha += 1/fadeTime; // alpha will reach 1 at set fade time
	   if alpha >= 1 {
			stage = 2;
	   }
	}
}
else if(stage == 2) { //Time to fade in the text
	if text_alpha < 1 {
	   text_alpha += 1/fadeTime; // alpha will reach 1 at set fade time
	   if text_alpha >= 1 {
			stage = 3;
	   }
	}
}
else if(stage==3) { //Time to display the text so it can be read
	if(text_frames > 0)
	{
		text_frames--;
	}
	else
	{
		stage = 4;
	}
}
else if(stage==4) { //Time to fade out the text
	if text_alpha > 0 {
	   text_alpha -= 1/fadeTime; // alpha will reach 1 at set fade time
	   if text_alpha <= 0 {
			stage = 5;
	   }
	}
}
else if(stage==5) { // Move the player if that is specified
	if (target_room != "" && room != real(target_room)) {
		room_goto(real(target_room));
	}
	if (move_target_x >= 0 && move_target_y >= 0) {
		player_object = instance_find(obj_player, 0);
		player_object.x = move_target_x;
		player_object.y = move_target_y;
	}
	if (face_direction >= 0) {
		scr_dialog_command("face:obj_player;" + string(face_direction));
	}
	stage = 6;
}
else if(stage==6) { //Time to fade back to the camera and end the flyover routine
	if(played_close == false) {
		played_close = true;
		with(instance_find(obj_player, 0)) {
			move_paused = false;
		}
		if(door_close_sound != noone) {
			audio_play_sound(snd_doorclose, 10, false);
		}
	}

	if alpha > 0 {
	   alpha -= 1/fadeTime; // alpha will reach 1 at set fade time
	   if alpha <= 0 {
		   instance_destroy();
	   }
	}
}