scr_set_movement_vars()

goes_idle = true;
interact_input = 0;
invulnerable_timer = 0;

//input temp
movement_inputs[0] = ord("D");
movement_inputs[1] = ord("W");
movement_inputs[2] = ord("A");
movement_inputs[3] = ord("S");

var this_player = self;

with(instance_find(obj_camera, 0)) {
	target = this_player;
}

if(global.current_x != 0 || global.current_y != 0) {
	x = global.current_x;
	y = global.current_y;
	global.current_x = 0;
	global.current_y = 0;
	invulnerable_timer = 120;
}

show_goodsmenu = false;