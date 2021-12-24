/// @description Insert description here
// You can write your code in this editor

if(!move_location) {
	move_time--;

	if(move_time <= 0) instance_destroy();

	var the_x = move_x_dir * move_speed;
	var the_y = move_y_dir * move_speed;

	with move_target {
		x += the_x;
		y += the_y;
		dir = point_direction(the_x + x, the_y + y, x, y);
	}
}
else {
	var got_there = false;
	var tar_x = target_x;
	var tar_y = target_y;
	var mov_speed = move_speed;
	with move_target {
		if point_distance(x, y, tar_x, tar_y) > 1
		{
			move_towards_point(tar_x, tar_y, mov_speed);
			dir = scr_adjust_direction(point_direction(tar_x, tar_y, x, y))	;
		}
		else {
			speed = 0;
			got_there = true;
		}
	}
	if(got_there == true) {
		var pass_dir = final_direction;
		with move_target {
			dir = pass_dir;
		}
		instance_destroy();
	}
}