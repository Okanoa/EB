/// @draw counter
///@param x
///@param y
///@param name
///@param hp
///@param pp
///@param skin

var _x = argument0;
var _y = argument1;
var name = argument2;
var hp = argument3;
var pp = argument4;
var skin = argument5;

draw_set_font(fnt_main);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

scr_transform_draw(_x,_y,0,0,0,1,1);

//draw_sprite(spr_ness_walk6, 0, x, y);
draw_sprite(spr_battle_stat,skin,0,0);

draw_text(61/2,10,name);

scr_transform_draw(_x+27,_y+24,0,0,0,1,1);

draw_odocounter(hp);

scr_transform_draw(_x+27,_y+24+12,0,0,0,1,1);

draw_odocounter(pp);

scr_transform_reset()