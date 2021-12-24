dir = 270
//movement speeds
move_speed = global.walk_speed;
run_move_speed = global.run_speed;
// animation speeds
walk_anim_speed = 0.1;
run_anim_speed = 0.16;
talk_anim_speed = 4.6;

counter = 0;

goes_idle = false;

xp = 0
yp = 0
crouch_p = 0
crouch_release_p = 0

sprite_group = "spr_ness"

//state stuff
movement_state = MovementStates.normal
crouch_timer = 0;

wait_timer = 0;
knock_timer = 0;

current_sprite_index = 0;

// custom animation stuff
custom_animation_loops = 0;