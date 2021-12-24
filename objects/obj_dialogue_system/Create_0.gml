event_inherited();

close_with_cancel_button = false;

// Entrance/Exit Animation variables
active = true;
surface = noone;
letterbox = true;
enter_speed = 4;
exit_speed = 5;
anim_offset = 90;
anim_approach = 0;
anim_target = 90;


command_map = ds_map_create();
processing_commands = false;
current_message = "";
halt = 2;
x_ = 0;
y_ = 0;
	//  active, from eg global.height

width = 5;
height = 5;
name = "";
lines = 3;
pixels_between_lines = 6;
current_height = 0;

jsonkey = ""

t = true;
tpos = 19;
yesval = ""
noval = ""
yes = ""
no = ""

show_prompt = false;
auto_advance = false;
msg_prog = 0;
msg_speed = .75;
temp_speed = 0;
pause_timer = 0;
txt_sound_wait = 0;
raw_string = "";

global.ui_active = true;