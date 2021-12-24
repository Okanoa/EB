if (splash_room == 0 ) {
	/*
	room_goto(rm_gasstation);
	splash_room++;
} else if (splash_room == 1) {
	audio_stop_all();
	*/
	room_goto(rm_titlescreen);
	instance_destroy();
}