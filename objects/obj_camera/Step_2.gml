/// @description Insert description here

if(track_player && target != noone && instance_exists(target)) {
	//var _x = round(target.x);
	//var _y = round(target.y);
	var targx = target.x//+sprite_get_width(target.current_sprite_index)/2
	var targy = target.y-sprite_get_height(target.current_sprite_index)/2
	var _x = floor(targx-global.width/2);
	var _y = floor(targy-global.height/2);
	camera_set_view_pos(view,_x,_y);
	//var view_matrix = matrix_build_lookat(_x, _y, -10000, _x, _y, 0, 0, 1, 0);
	//camera_set_view_mat(view, view_matrix);
}
