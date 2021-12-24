/// @description Insert description here
// You can write your code in this editor
var s = global.stats; //shorten for ease

var i;
var pos = -1;
var bwid = sprite_get_width(spr_battle_stat)+8
var bhei = sprite_get_height(spr_battle_stat)-8
var mpos = (global.width/2)
var fulcnt = s[# 0, 0]+s[# 1, 0]+s[# 2, 0]+s[# 3, 0]

var xlocked = camera_get_view_x(view)
var ylocked = camera_get_view_y(view)

if cp != xlocked+ylocked
{
	cp = xlocked+ylocked
	yac = 0;
}

depth = -(ylocked+2000);

if keyboard_check_pressed(vk_space) {
	yac = !yac;
}

if yac
{
	yp = scr_approach(yp,0,2); //up
}
else
{
	yp = scr_approach(yp,bhei+5,2); //down
}

var center = (mpos)-((fulcnt*bwid)/2)

for(i = 0; i < 4; i++) { //loop through hp and and preform counting down
	
	if(s[# i, 0] = true) { //check if active party member
		
		pos++;
		
		if(s[# i, 16]) {
			var skin = 5;	
		} else {
			//tim++;
			var skin = 0//(tim/192) % 5;
			if s[# 0, 3] <= 0 then s[# 0, 16] = true;
		}
		draw_battle_stats((pos*bwid)+center+xlocked,global.height-bhei+ylocked+yp,s[# i, 17],s[# i, 3],s[# i, 6],skin)
		
	}
	
}