display_set_gui_size(global.width, global.height);

//Draw menu background
if(menu_base != noone) {
	draw_sprite(menu_base, 0, x_location, y_location);
}

//Draw cursor
if(has_cursor == true && marker != noone) {
	if(cursor_current_x != cursor_x[| selected])
		cursor_current_x += ((cursor_x[| selected] -cursor_current_x) * .30);
		
	if(cursor_current_y != cursor_y[| selected])
		cursor_current_y += ((cursor_y[| selected] -cursor_current_y) * .30);
	
	draw_sprite(marker, 0, cursor_current_x, cursor_current_y);
}