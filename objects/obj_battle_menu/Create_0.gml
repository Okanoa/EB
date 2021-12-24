/// @description Insert description here
// You can write your code in this editor
event_inherited();

battle_manager = noone;
current_player = 0;

has_cursor = true;
close_with_cancel_button = false;

image_speed = 0;

menu_base = spr_battle_menu;
menu_icons = spr_icons;
marker = spr_marker;

x_location = 125//global.width/2;
y_location = 0;
max_selection = 6;

ds_list_add(cursor_x, 94-67, 125-67, 152-67, 176-67, 204-67, 238-67);
ds_list_add(cursor_y, 26, 26, 26, 26, 26, 26);


ds_list_add(cursor_actions, "attack", "attack", "attack", "attack", "run");

cursor_current_x = cursor_x[| selected]
cursor_current_y = cursor_y[| selected]