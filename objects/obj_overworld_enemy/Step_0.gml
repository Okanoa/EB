var on_screen = scr_is_on_screen(self);
var camera_x = camera_get_view_x(view_camera[0]);
var camera_y = camera_get_view_y(view_camera[0]);
var camera_width = camera_get_view_width(view_camera[0]);
var camera_height = camera_get_view_height(view_camera[0]);
var current_xp = xp;
var current_yp = yp;
var target = instance_find(obj_player, 0);

if(delay_timer > 0) {
	delay_timer --;
}

if(!global.ui_active && on_screen && target != noone && delay_timer <= 0) {
	switch(movement_type) {
		case EnemyMovementStyles.direct_follow:
			var new_x = target.x - x;
			var new_y = target.y - y;
			
			var tolerance = target.bbox_right - target.bbox_left - 2;
			
			if (new_x > 0 && new_x < tolerance) new_x = 0;
			if (new_x < 0 && new_x > (-tolerance)) new_x = 0;
			if (new_y > 0 && new_y < tolerance) new_y = 0;
			if (new_y < 0 && new_y > (-tolerance)) new_y = 0;
			
			xp = sign(new_x);
			yp = sign(new_y);
			
			if(xp != current_xp || yp != current_yp) {
				delay_timer = movement_delay;
				current_xp = xp;
				current_yp = yp;
			}
			break;
	}
	if(target.invulnerable_timer == 0)
		scr_movement();
	else if(target.invulnerable_timer > 0 && battle_added) {
		battle_added = false;
	}
}

