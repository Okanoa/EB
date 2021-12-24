/// @description Insert description here
// You can write your code in this editor

if(y_travel > 0 ) {
	y -= 1;
	y_travel --;
	if(y_travel <= 0) {
		fade_out = true;
	}
}

if(!fade_out) {
	if(alpha < 1) {
		alpha += alpha_step;
	}
} else {
	if(pause_time > 0) {
		pause_time --;
	} else if(alpha > 0) {
		alpha -= alpha_step;
		if(alpha <= 0) instance_destroy();
	}
}