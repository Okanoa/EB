// Check if UIs are active
if(ds_list_size(ui_stack) > 0 && global.ui_active == false)
{
	global.ui_active = true;
}

if(ds_list_size(ui_stack) == 0 && global.ui_active == true) {
	global.ui_active = false;
}

if(global.ui_active == true) {
	//Handle inputs
	var _action = keyboard_check(global.action_button);
	var _accept = keyboard_check(global.accept_button);
	var _action_press = keyboard_check_pressed(global.action_button);
	var _accept_press = keyboard_check_pressed(global.accept_button);
	var _cancel_press = keyboard_check_pressed(global.cancel_button);
	var _cancel = keyboard_check(global.cancel_button);
	var _left = keyboard_check(global.left_button);
	var _right = keyboard_check(global.right_button);
	var _up = keyboard_check(global.up_button);
	var _down = keyboard_check(global.down_button);
	var _left_press = keyboard_check_pressed(global.left_button);
	var _right_press = keyboard_check_pressed(global.right_button);
	var _up_press = keyboard_check_pressed(global.up_button);
	var _down_press = keyboard_check_pressed(global.down_button);
	with(ds_list_find_value(ui_stack, ds_list_size(ui_stack) - 1)) {
		if(initial_dead_to_input <= 0) {
			action_key = _action;
			accept_key = _accept;
			action_press = _action_press;
			accept_press = _accept_press;
			cancel_press = _cancel_press;
			cancel_key = _cancel;
			left_key = _left;
			right_key = _right;
			up_key = _up;
			down_key = _down;
			left_press = _left_press;
			right_press = _right_press;
			up_press = _up_press;
			down_press = _down_press;
		
			if(cancel_press > 0 && close_with_cancel_button) {
				instance_destroy();
			}
		}
	}
}