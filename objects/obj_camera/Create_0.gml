/// @Initalize globals
init_game();
draw_set_font(fnt_main);
gpu_set_ztestenable(true);

//view = camera_create()
//view_matrix = matrix_build_lookat(0, 0, -10000, 0, 0, 0, 0, 1, 0);
//projection_matrix = matrix_build_projection_ortho(global.width, global.height, 1, 10000);

//camera_set_view_mat(view, view_matrix);
//camera_set_proj_mat(view, projection_matrix);

shake_duration = 0;
shake_force = 0;
shake = false;
camera_pan_duration = 0;
pan = false;
pan_x_step = 0;
pan_y_step = 0;
look_duration = 0;
track_player_lock = false;
original_x = noone;
original_y = noone;

track_player = true;

target = noone;

move_paused = false;
in_battle = false;
