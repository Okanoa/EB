/// @description Insert description here
// You can write your code in this editor

var mxp = clamp(obj_player.xp,min(0,-sign(image_xscale)),max(0,-sign(image_xscale)));
var myp = clamp(obj_player.yp,min(0,-sign(image_yscale)),max(0,-sign(image_yscale)));


if(place_meeting(x-mxp,y,obj_player) && obj_player.yp = 0) {
	with(obj_player) {
		if(!place_meeting(x,y + sign(other.image_yscale*move_speed),obj_solid)) {
			y += sign(other.image_yscale*move_speed);
		}
	}
}

if(place_meeting(x,y-myp,obj_player) && obj_player.xp = 0) {
	with(obj_player) {
		if(!place_meeting(x + sign(other.image_xscale*move_speed),y,obj_solid)) {
			x += sign(other.image_xscale*move_speed);
		}
	}
}