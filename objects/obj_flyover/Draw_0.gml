draw_set_alpha(alpha);

draw_set_colour(c_black);

draw_rectangle(0,0,room_width,room_height,-1);

draw_set_alpha(text_alpha);

draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_set_font(fnt_flyover);
draw_set_color(c_white);
var h_center = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
var v_center = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
draw_text(h_center,v_center,flyover_text);

draw_set_alpha(1); //reset alpha value so it doesn't mess with other draw events