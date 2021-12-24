///movement code
/// @arg speed
/// @arg xdir
/// @arg ydir
 
var spd = argument[0];
var xdir = argument[1];
var ydir = argument[2];
var collided = noone;

if(xdir != 0 or ydir != 0) {
	var dir = point_direction(0,0,xdir,ydir);
	var xtarg = lengthdir_x(spd, dir);
	var ytarg = lengthdir_y(spd,dir);

	if(!place_meeting(x+xtarg,y,obj_solid)) {
			x += xtarg	
	} else {
		collided = instance_place(x+xtarg, y, obj_solid);
		if(object_is_ancestor(object_index, obj_overworld_enemy) && collided.object_index == obj_player) {
			x += xtarg
		} else {
			while(!place_meeting(x+sign(xtarg),y,obj_solid)) {
				x += sign(xtarg)
			}
		}
	}

	if(!place_meeting(x,y+ytarg,obj_solid)) {
			y += ytarg	
	} else {
		collided = instance_place(x, y + ytarg, obj_solid);
		if(object_is_ancestor(object_index, obj_overworld_enemy) && collided.object_index == obj_player) {
			y += ytarg
		} else {
			while(!place_meeting(x,y+sign(ytarg),obj_solid)) {
				y += sign(ytarg)
			}
		}
	}
}
 
