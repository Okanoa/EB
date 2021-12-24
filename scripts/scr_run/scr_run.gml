/// Makes the character start running in a specified direction, returns true if they are running without collision, and false if they collide and stop running
/// @arg speed
/// @arg direction
 
var spd = argument[0];
var dir = argument[1];

var x_target = x + lengthdir_x(spd, dir);
var y_target = y + lengthdir_y(spd, dir);

if(place_meeting(x_target, y_target, obj_solid)) {
	speed = 0;
	var collided = instance_place(x_target, y_target, obj_solid);
	with (collided) {
		event_perform(ev_collision, obj_player);
	}
	return false;
} else {
	if(dir != direction) speed = 0;
	move_towards_point(x_target, y_target, spd);
	return true;
}
