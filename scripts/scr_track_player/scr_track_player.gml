/// @description Sets the camera to track the player if true, and tells the camera not to if false
/// @param follow true or false

var follow = argument[0];

if(argument_count > 1) {
	var track_lock = argument[1];

	with instance_find(obj_camera, 0) {
		track_player = follow;
		track_player_lock = track_lock;
	}
}