if (keyboard_check_pressed(vk_right)) { selected++; }
if (keyboard_check_pressed(vk_left)) { selected--; }
if (selected == 6) { selected = 0; }
if (selected == -1) { selected = 5; }

if (keyboard_check_pressed(vk_down)) { global.box_color++; }
if (keyboard_check_pressed(vk_up)) { global.box_color--; }
if (global.box_color == 6) { global.box_color = 0; }
if (global.box_color == -1) { global.box_color = 5; }

if (selected == 0) {
	global.box_style = spr_box;
	box_style = "Soft"
} else if (selected == 1) {
	global.box_style = spr_hardbox;
	box_style = "Hard"
} else if (selected == 2) {
	global.box_style = spr_paperbox;
	box_style = "Paper"
} else if (selected == 3) {
	global.box_style = spr_tinbox;
	box_style = "Tin"
} else if (selected == 4) {
	global.box_style = spr_plasticbox;
	box_style = "Plastic"
} else if (selected == 5) {
	global.box_style = spr_metalbox;
	box_style = "Metal"
}

if (global.box_color == 0) {
	box_color = "Plain"
} else if (global.box_color == 1) {
	box_color = "Mint"
} else if (global.box_color == 2) {
	box_color = "Strawberry"
} else if (global.box_color == 3) {
	box_color = "Lemon"
} else if (global.box_color == 4) {
	box_color = "Peanut"
} else if (global.box_color == 5) {
	box_color = "Grape"
}

if keyboard_check_pressed(global.cancel_button) {
	instance_create_depth(x,y, -1, obj_mainmenu);
	instance_destroy();
}