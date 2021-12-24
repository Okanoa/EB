///Resolution and globals

//pixel perfect game size
global.width = 384;
global.height = 216;

//window scale
global.zoom = 2;

//fix surface size
surface_resize(application_surface, global.width, global.height);
display_reset(0, true);

//camera macro for easy access
#macro view view_camera[0]

//show fps and performance
show_debug_overlay(true);

window_set_caption("PRE BUILD MOTHER FOREVER RECORDING BUILD 1")

global.hitfont = font_add_sprite(spr_battlehitnumb,ord("0"),true,0)

//player stats
global.stats = ds_grid_create(4,20);
global.current_room = 0;
global.current_music = 0;
global.current_x = 0;
global.current_y = 0;
global.party = ds_list_create();
global.eventflags = ds_map_create();

//player movement
global.walk_speed = 1.7;
global.run_speed = 3.2;

ds_list_add(global.party, "Ness");

var s = global.stats; //shortening for ease

// row 0 Ness - row 1 Paula - row 2 Jeff - row 3 Poo
//NESS - stats inaccurate please set to actual base stats.
s[# 0, 0] = true //active

s[# 0, 1] = 30 //hp cap
s[# 0, 2] = 30 //hp goal
s[# 0, 3] = 30 //hp

s[# 0, 4] = 10 //pp cap
s[# 0, 5] = 10 //pp goal
s[# 0, 6] = 10 //pp

s[# 0, 7] = 1 //level
s[# 0, 8] = 1 //exp
s[# 0, 9] = 10 //attack
s[# 0, 10] = 10 //defense
s[# 0, 11] = 10 //speed
s[# 0, 12] = 10 //guts
s[# 0, 13] = 10 //luck
s[# 0, 14] = 10 //vitality
s[# 0, 15] = 10 //iq
s[# 0, 16] = false //dead
s[# 0, 17] = "Ness" //name
s[# 0, 18] = 0 //visual damager

// PAULA
s[# 1, 0] = false //active

s[# 1, 1] = 30 //hp cap
s[# 1, 2] = 30 //hp goal
s[# 1, 3] = 30 //hp

s[# 1, 4] = 10 //pp cap
s[# 1, 5] = 10 //pp goal
s[# 1, 6] = 10 //pp

s[# 1, 7] = 1 //level
s[# 1, 8] = 1 //exp
s[# 1, 9] = 10 //attack
s[# 1, 10] = 10 //defense
s[# 1, 11] = 10 //speed
s[# 1, 12] = 10 //guts
s[# 1, 13] = 10 //luck
s[# 1, 14] = 10 //vitality
s[# 1, 15] = 10 //iq
s[# 1, 16] = false //dead
s[# 1, 17] = "Paula" //name
s[# 1, 18] = 0 //visual damager

//JEFF
s[# 2, 0] = false //active

s[# 2, 1] = 30 //hp cap
s[# 2, 2] = 30 //hp goal
s[# 2, 3] = 30 //hp

s[# 2, 4] = 10 //pp cap
s[# 2, 5] = 10 //pp goal
s[# 2, 6] = 10 //pp

s[# 2, 7] = 1 //level
s[# 2, 8] = 1 //exp
s[# 2, 9] = 10 //attack
s[# 2, 10] = 10 //defense
s[# 2, 11] = 10 //speed
s[# 2, 12] = 10 //guts
s[# 2, 13] = 10 //luck
s[# 2, 14] = 10 //vitality
s[# 2, 15] = 10 //iq
s[# 2, 16] = false //dead
s[# 2, 17] = "Jeff" //name
s[# 2, 18] = 0 //visual damager

//POO
s[# 3, 0] = false //active

s[# 3, 1] = 30 //hp cap
s[# 3, 2] = 30 //hp goal
s[# 3, 3] = 30 //hp

s[# 3, 4] = 10 //pp cap
s[# 3, 5] = 10 //pp goal
s[# 3, 6] = 10 //pp

s[# 3, 7] = 1 //level
s[# 3, 8] = 1 //exp
s[# 3, 9] = 10 //attack
s[# 3, 10] = 10 //defense
s[# 3, 11] = 10 //speed
s[# 3, 12] = 10 //guts
s[# 3, 13] = 10 //luck
s[# 3, 14] = 10 //vitality
s[# 3, 15] = 10 //iq
s[# 3, 16] = false //dead
s[# 3, 17] = "Poo" //name
s[# 3, 18] = 0 //visual damager

global.enemy_stat = ds_list_create();
var enm = global.enemy_stat;
//enemy format [spr_id,x,y,rot,hp,dmg,spd]
ds_list_add(enm,[0,0,0,0,120,20],[2,0,0,0,120,30],[24,0,0,0,120,10])

global.enemy_data = scr_load_json_file("enemies.json");
global.enemies = ds_list_create();
global.enemy_objects = ds_list_create();
global.combat_won = false;
global.ability_data = scr_load_json_file("battle_abilities.json");
global.eventflags[? "frankdead"] = 0
global.npc_data = scr_load_json_file("npc_dat.json")
global.battle_strings = scr_load_json_file("battle_text.json");
// controls
global.up_button = vk_up;
global.down_button = vk_down;
global.left_button = vk_left;
global.right_button = vk_right;
global.accept_button = vk_enter;
global.cancel_button = ord("Z");
global.action_button = ord("X");

// enums
enum MovementStates {
	normal,
	crouching,
	running,
	cancelled,
	talking,
	knocking,
	custom_animation
}

enum EnemyMovementStyles {
	direct_follow,
	pause_follow,
	random_movement
}

// macros for directions
#macro up_dir 90;
#macro down_dir 270;
#macro left_dir 180;
#macro right_dir 0;
#macro up_right_dir 45;
#macro up_left_dir 135;
#macro down_right_dir 315;
#macro down_left_dir 225;

// Dialog/UI related
global.box_style = spr_box;
global.box_color = 0;
global.talking_npc = -1;
global.ui_active = false;
global.ui_manager = instance_create_depth(0, 0, 0, ui_manager);