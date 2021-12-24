///movement code
/// @arg object ID

var object_instance = argument0;

var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);
var camera_width = camera_get_view_width(view_camera[0]);
var camera_height = camera_get_view_height(view_camera[0]);

with(object_instance) {
	if(bbox_right > camera_x && bbox_left < camera_x + camera_width && bbox_bottom > camera_y && bbox_top < camera_y + camera_height) {
		return true;
	}
}

return false;
