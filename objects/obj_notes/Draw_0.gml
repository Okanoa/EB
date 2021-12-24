/// @description Insert description here
// You can write your code in this editor
//depth = -y*2

var rcount = clamp(count,0,floor(nt));

var additive = 360/spacing;
spacing=scr_approach(spacing,rcount,.2)

nt+=.05



//count = clamp(count+1,min(2,1+floor(nt)),18 )

if abs(ended) {
	fly+=.5*ended;	
	fly=max(fly,0);
	end_timer--;
	if(end_timer <= 0 || fly=0) {
		instance_destroy();
	}
}

for(var i = 0; i<ceil(spacing); i++) {
	var ldx = lengthdir_x(64*fly,(get_timer()/4000)+additive*i)
	var ldy = lengthdir_y(24*fly,(get_timer()/4000)+additive*i)
	var wobl = (sin(get_timer()/1000000)*(ldx/64))*8
	ds_priority_add(obj_battle_manager.enemy_sort,[0,x+ldx,y+ldy+wobl,0,0,1],y+ldy+wobl+32)
	//draw_sprite(spr_music_note,0,x+ldx,y+ldy+wobl)	
}

if keyboard_check_pressed(ord("J")) {
	count++;
}
if keyboard_check_pressed(ord("H")) {
	count--;
}
if keyboard_check_pressed(ord("Q")) {
	ended = true;
}