/// @Movement and previous xy pos
// You can write your code in this editor

var crouch_time = 30;
var knock_speed = 0.2;

var camera = instance_find(obj_camera, 0);

if(xp != 0 or yp != 0)
	dir = point_direction(0,0,xp,yp);

if(crouch_timer > 0) 
{
	crouch_timer--;
	if(crouch_release_p) {
		crouch_timer = 0;
	}
	if(crouch_timer <= 0) 
		movement_state = MovementStates.normal;
}

// Crouch if we are walking
if (crouch_p != 0 && movement_state == MovementStates.normal && crouch_timer <= 0) movement_state = MovementStates.crouching;
// If we are running and the crouch key is hit, stop running
if (crouch_p != 0 && movement_state == MovementStates.running) movement_state = MovementStates.cancelled;
// If we start walking while crouching, cancel the crouch if the crouch key is let go
if (crouch_p == 0 && movement_state == MovementStates.crouching && (xp != 0 or yp != 0)) movement_state = MovementStates.normal;
// If we are crouching and let go of the crouch key we should start running
if (crouch_p == 0 && movement_state == MovementStates.crouching) movement_state = MovementStates.running;

if(!global.ui_active && (!instance_exists(obj_battle_transition) || object_is_ancestor(self.object_index, obj_overworld_enemy)) && movement_state != MovementStates.talking && movement_state != MovementStates.custom_animation) {
	// Handle states where the player can be walking, such as normal state or when the crouch button is held down
	if(movement_state == MovementStates.normal or movement_state == MovementStates.crouching or movement_state == MovementStates.cancelled) {
		scr_move(move_speed, xp, yp);
		image_speed = walk_anim_speed;	
		current_sprite_index = asset_get_index(sprite_group + "_walk" + string(scr_dir_to_anim_set(dir)));
		if(xp == 0 and yp == 0) {
			if(movement_state == MovementStates.crouching)
				current_sprite_index = asset_get_index(sprite_group + "_crouch" + string(scr_dir_to_anim_set(dir)));
			else {
				image_index = 0;
			}
		}
	// Handle running state
	} else if(movement_state == MovementStates.running) {
		// scr_run will return true if we are able to run and we haven't run into anything
		if(scr_run(run_move_speed, dir)) {
			image_speed = run_anim_speed;
			// If this is an odd step, let's play the step sound effect
			if (round(image_index) mod 2 != 0 && !audio_is_playing(snd_step)) {
				audio_play_sound(snd_step,10,false);
			}
			current_sprite_index = asset_get_index(sprite_group + "_run" + string(scr_dir_to_anim_set(dir)));
		}
		// If scr_run did not return true, we hit something, so we're not running anymore
		else {
			movement_state = MovementStates.normal;
			if !audio_is_playing(snd_bump) audio_play_sound(snd_bump,10,false);
		}
	}
} else if(movement_state != MovementStates.custom_animation) {
	// In this case we are talking or in some sort of UI
	speed = 0;
	// If we are in a talking state we need to run talking animation
	if(movement_state == MovementStates.talking && self == global.talking_npc) {
		current_sprite_index = asset_get_index(sprite_group + "_talk" + string(scr_dir_to_anim_set(dir)));
		image_speed = talk_anim_speed;
	}
	// If we get here we are in a UI, so we need to maintain the player in a stationary position
	else if(movement_state == MovementStates.crouching) {
		current_sprite_index = asset_get_index(sprite_group + "_crouch" + string(scr_dir_to_anim_set(dir)));
	}
	else {
		current_sprite_index = asset_get_index(sprite_group + "_walk" + string(scr_dir_to_anim_set(dir)));
		image_index = 0;
	}
}

// Handle cancelled state of running
if(movement_state == MovementStates.cancelled && crouch_timer <= 0) {
	current_sprite_index = asset_get_index(sprite_group + "_walk" + string(scr_dir_to_anim_set(dir)));
	speed = 0;
	crouch_timer = crouch_time;
}

// Knocking
if movement_state == MovementStates.knocking {
	knocking_timer --;
	current_sprite_index = asset_get_index(sprite_group + "_knock2");
	image_speed = knock_speed;
	if (knocking_timer <= 0) {
		movement_state = MovementStates.normal;
		current_sprite_index = asset_get_index(sprite_group + "_walk" + string(scr_dir_to_anim_set(dir)));
		image_index = 0;
		with(camera) {
			track_player = true;
		}
	}
}

// Idle animation
if movement_state == MovementStates.normal && xp = 0 && yp = 0 {
	if(!instance_exists(obj_dialogue_system)){
		if goes_idle == true {
			wait_timer++;
			if wait_timer > 10*60 {
				image_index=(wait_timer-(10*60))/7;
				current_sprite_index = asset_get_index(sprite_group + "_idle" + "6");	
			}
			if wait_timer > (10*60)+(14*7)
			{
				wait_timer = 0;
			}
		}
	}
	
} else {
	wait_timer = 0;	
}

if movement_state == MovementStates.custom_animation {
	if (image_index > sprite_get_number(current_sprite_index) - 1) {
		if(custom_animation_loops == 0) {
			movement_state = MovementStates.normal;
			image_speed = walk_anim_speed;
		} else if(custom_animation_loops > 0) {
			custom_animation_loops--;
			image_index = 0;
		}
	}
}

if (current_sprite_index == 0) {
	asset_get_index(sprite_group + "_walk" + string(scr_dir_to_anim_set(dir)));
}
