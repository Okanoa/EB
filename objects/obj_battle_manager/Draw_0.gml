/// @description Draw stats and enemies
var stats = global.stats; //shorten for ease

var i;
var pos = -1;
var battle_sprite_width = sprite_get_width(spr_battle_stat)+8
var battle_sprite_height = sprite_get_height(spr_battle_stat)-8
var middle_position = (global.width/2)
var fulcnt = stats[# 0, 0]+stats[# 1, 0]+stats[# 2, 0]+stats[# 3, 0]

// Lines 12-16 aren't ideal code...
draw_set_color(c_black);
//draw_set_alpha();
draw_rectangle(0,0,384,15,false);
draw_rectangle(0,187,384,216,false);
//draw_set_alpha(1);




enemy_count = ds_list_size(global.enemies);
enemy_scroll = enemy_count//scr_approach(enemy_scroll,enemy_count,1/30)

var battle_sprite_width = (middle_position*2)/5
var center = (middle_position)-((enemy_scroll*battle_sprite_width)/2)

if keyboard_check_pressed(vk_delete) then ds_list_delete(enm,irandom_range(0,ds_list_size(enm)-1))
if keyboard_check_pressed(vk_insert) then ds_list_add(enm,[irandom_range(0,198),global.width+battle_sprite_width,120,0,120,30])

// iterate over the enemies to determine how they will be drawn on the screen
for (var e = 0; e < ds_list_size(global.enemies); e++) //CHANGED THIS FROM enemy_position might work?
{
	// get next enemy in list
	var enemy_position = ds_list_find_value(enemy_positions, e); //enm[| e]

	// Calculate x and y positions of the enemy sprites
	var py = 150+(~~lengthdir_y(10,((e+enemy_scroll)-.5)*180))
	var px = (battle_sprite_width/2)+(e*battle_sprite_width)+center
	
	ds_map_set(global.enemies[| e], "xpos", px);
	ds_map_set(global.enemies[| e], "ypos", py - battle_sprite_height + 10);

	// index 1 is x, index 2 is y, index 3 is rotation
	enemy_position[1] += ((px -enemy_position[1]) * .1);
	enemy_position[2] += ((py -enemy_position[2]) * .1);
	enemy_position[3] = scr_approach(enemy_position[3],0,1)
	
	enemy_positions[| e] = enemy_position;
	
	// check if the enemy being sorted is selected
	var sel = 0;
	
	if selected == e && scr_get_active_ui() == self {
		//if accept_key then enemy_position[3] = choose(-10,10);
		sel = 1;
	}
	
	// Add the sorted enemies to the sorted list, index 6 is enemy's original index
	ds_priority_add(enemy_sort,[enemy_position[0],~~enemy_position[1],enemy_position[2],sel,enemy_position[3],0, e],enemy_position[2])
}

//draw sorted enemies
var esize = ds_priority_size(enemy_sort)

for (e = 0; e < esize; e++)
{
	var dat = ds_priority_delete_min(enemy_sort)
	
	if dat[5] == 0 {
	
		var bounc = 0//(lengthdir_y(10,abs(dat[4]/10)*180))
	
		var rot = (lengthdir_y(5,(dat[4]/10)*360))
	
		draw_sprite_ext(spr_enemies, dat[0], dat[1], dat[2]+bounc,1,1,rot,c_white,1); // normal
	
		if dat[3] then gpu_set_fog(true,c_white,0,0);
		// If our enemy needs to flash (like when executing an attack), let's do it!
		if(enemy_flash == dat[6] && flash_counter > 0) {
			if (flash_counter mod 1 == 0) {
				alpha_flash += flash_step;
			} else {
				alpha_flash -= flash_step;
			}
			gpu_set_fog(true,c_white,0,0);
			if (alpha_flash < 0 || alpha_flash > 1) {
				flash_counter -= 0.5;
			}
			draw_sprite_ext(spr_enemies, dat[0], dat[1], dat[2]+bounc,1,1,rot,flash_color,alpha_flash);
			if(flash_counter <= 0) {
				alpha_flash = 0;
				flash_counter = 2;
				enemy_flash = -1; 
			}
		} else {
			// We're selecting an enemy, but only if this is the active UI
			if(scr_get_active_ui() == self)
				draw_sprite_ext(spr_enemies, dat[0], dat[1], dat[2]+bounc,1,1,rot,c_white,.5); // overlay
		}
		gpu_set_fog(false,c_white,0,0);
	
	} else {
		draw_sprite(spr_music_note,0,dat[1], dat[2])	
	}
}

//ds_priority_destroy(enemy_sort)

var center = (middle_position)-((fulcnt*battle_sprite_width)/2)

for(i = 0; i < 4; i++) { //loop through hp and and preform counting down
	
	if(stats[# i, 0] = true) { //check if active party member
		
		pos++;
		
		if(stats[# i, 16]) {
			var skin = 5;	
		} else {
			var skin = 0
			if stats[# 0, 3] <= 0 then stats[# 0, 16] = true;
		}
		
		if(i = 0) { // use for damage eventually!
			wibble = scr_approach(wibble,stats[# i, 18],1);
			var lob = round(sin(stats[# i, 18]*2)*wibble);
			stats[# i, 18] = clamp(stats[# i, 18]-.25,0,10);
		} else {
			var lob = 0;
		}
		draw_sprite(spr_ness_status, 0, (pos*battle_sprite_width)+center+lob+7+(battle_sprite_width/2), status_current[0]);
		draw_battle_stats((pos*battle_sprite_width)+center+lob+8,global.height-battle_sprite_height,stats[# i, 17],stats[# i, 3],stats[# i, 6],skin)
		
	}
	
}

// Draw combo number and total damage if necessary
if(damage_display_timer > 0) {
	damage_display_timer --;
	draw_set_font(global.hitfont);
	var text_spacing = 6;
	var character_width = 12;
	var character_spacing = 2;
	var char_hit = string_length(string(display_count));
	var char_dam = string_length(string(display_damage));
	var hit_num_width = (char_hit * character_width) + ((char_hit - 1) * character_spacing);
	var damage_num_width = (char_dam * character_width) + ((char_dam - 1) * character_spacing);
	var hit_y = global.height * 0.25;
	var hit_x = global.width / 2 - (sprite_get_width(spr_hits) / 2) + (hit_num_width / 2); 
	var dam_y = global.height * 0.3 + text_spacing;
	var dam_x = global.width / 2 - (sprite_get_width(spr_total_damage) / 2) - (damage_num_width / 2);
	draw_set_halign(fa_right);
	var num_padding = 3;
	draw_text_transformed_color(hit_x, hit_y, string(display_count), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	draw_sprite(spr_hits, 0, hit_x + num_padding, hit_y + 1);
	draw_set_halign(fa_left);
	draw_text_transformed_color(dam_x + sprite_get_width(spr_total_damage) + num_padding, dam_y, string(display_damage), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	draw_sprite(spr_total_damage, 0, dam_x, dam_y + 1);
	// If we hit the dialog_return_point, open the dialogue system back up
	if(damage_display_timer <= dialog_return_point) {
		total_damage = 0;
		combo_count = 0;
		var dialogue_sys = instance_find(obj_dialogue_system, 0);
		with dialogue_sys visible = true;
		scr_make_active_ui(dialogue_sys);
	}
}
