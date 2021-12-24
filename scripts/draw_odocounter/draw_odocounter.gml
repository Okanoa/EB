///gamer
///@param get

var get = argument0;
var p = 0;
var pt = 0;
var po = 0;

if get <= 100 {
    if get > 99 { p = (get - 99) * 8; }
    else { p = 0; }
} else {
    if get mod 100 > 99 { p = (get mod 1000 div 100 * 8) + (get mod 100 - 99) * 8; }
    else { p = get mod 1000 div 100 * 8; }
}

// Tens place
if (get <= 10) {
  if (get > 9) {
    pt =  (get - 9) * 8;
  } else {
    pt = 0;
  }
} else {
  if (get mod 10 > 9) {
    pt = (get mod 100 div 10 * 8) + (get mod 10 - 9) * 8;
  } else {
    pt =  get mod 100 div 10 * 8;
  }
}

// Ones place
po =  get mod 10 * 8;

draw_sprite_part(spr_battle_numb,0,0,(po)-1,7,9,16,0);
	
if(get < 11) {
	draw_sprite_part(spr_battle_numb,1,0,(pt)-1,7,9,8,0);
} else {
	draw_sprite_part(spr_battle_numb,0,0,(pt)-1,7,9,8,0);
}
	
if(get < 101) {
	draw_sprite_part(spr_battle_numb,1,0,(p)-1,7,9,0,0);
} else {
	draw_sprite_part(spr_battle_numb,0,0,(p)-1,7,9,0,0);
}