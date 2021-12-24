///@param sprite
///@param sub
///@param dir
var sprite = argument0;
var sub = argument1;
var dir = argument2;

var leg = floor((sprite_get_number(sprite))/8);

var subf = sub % leg

var dir8 = (dir/(360/8));
var i
for(i = 0; i <= 7; i++) {
	if(dir8 = i) {
		var _x = floor(x);
		var _y = floor(y);
		draw_sprite(sprite,subf+(i*leg),_x,_y)
	}
}
draw_text(x,y,dir8)
draw_text(x,y+10,subf)
