/// @description Insert description here
// You can write your code in this editor
animtime+=.4;
if animtime < 3 {
draw_sprite(fx,animtime,startxy[0],startxy[1])
}

draw_set_font(global.hitfont);
draw_text_transformed_color(x, y, damage, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
