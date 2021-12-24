//draw_sprite(swirl, -1, x,y)

depth = -camera_get_view_y(view_camera[0])


if(stage != 2) {
	draw_set_alpha(alpha);
	draw_set_colour(c_black);
	draw_rectangle(0,0,room_width,room_height,-1);

	draw_set_alpha(1); // Reset alpha value so it doesn't mess with other draw events
}