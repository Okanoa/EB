/// @description Insert description here
// You can write your code in this editor
//player_detect = collision_rectangle(x-135,y-135,x+135,y+135,obj_player,false,false)

if(instance_exists(obj_player))
{
	if point_in_circle(obj_player.x,obj_player.y,xr,yr,detection)
	{
		var pdir = -point_direction(obj_player.x,obj_player.y,xr,yr)
		wave++;
		xr -= lengthdir_x(movespeed,pdir)
		yr += lengthdir_y(movespeed,pdir)
		
		x = xr + lengthdir_x(128,wave*wavefreq);
		y = yr;
	}
}