/// @Movement and previous xy pos
// You can write your code in this editor


if(!global.ui_active) {
	xp = keyboard_check(global.right_button) - keyboard_check(global.left_button);
	yp = keyboard_check(global.down_button) - keyboard_check(global.up_button);
	crouch_p = keyboard_check(global.cancel_button);
	crouch_release_p = keyboard_check_released(global.cancel_button);
	interact_input = keyboard_check_pressed(global.action_button);
	if(interact_input > 0)
	{
		scr_probe_interaction(dir);
	}
}

if(invulnerable_timer > 0) {
	invulnerable_timer --;	
}

scr_movement();

if room = rm_battle
{
	move_speed = 0;
	run_move_speed = 0;
	x = 512
	y = 384
}

if (keyboard_check_pressed(vk_decimal)) {
	show_goodsmenu = !show_goodsmenu
}