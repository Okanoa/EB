if (selected == 0) {
	draw_sprite(spr_mainmenu, selected, x, y)
} else if (selected == 1) {
	draw_sprite(spr_mainmenu, selected, x, y);
}	else if (selected == 2) {
	draw_sprite(spr_mainmenu, selected, x, y)
}
var idd = layer_background_get_id("Background")

layer_background_index(idd, clamp(layer_background_get_index(idd),0,17));