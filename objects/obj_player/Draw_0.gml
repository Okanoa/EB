// Check if the player is currently invulnerable, and flash the sprite
if(invulnerable_timer > 0) {
	if(invulnerable_timer mod 5 == 0) {
		image_alpha = 0.5;
	} else {
		image_alpha = 0.1;
	}
} else {
	image_alpha = 1;
}
scr_custom_draw()

