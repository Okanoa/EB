/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_battle_manager) {if obj_battle_manager.combo_count > 1 {return}};

//Local variables for text positions
var line_space = pixels_between_lines;

var line_x_position = x_;
var dot_x_position = 10;
var name_x_position = 9;
var name_y_position = -9;
var indent_x_position = 21;
var text_box_border = 10;
var name_box_x_position = 2;
var name_box_y_position = -24;
var max_line_height = line_space;
var xlocked = camera_get_view_x(view)+x_;
var ylocked = camera_get_view_y(view)+y_;

// top margin size
var margt = 22*(1-(anim_offset/anim_target));
// bottom margin size
var margb = 22*(1-(anim_offset/anim_target));

//show_debug_message(anim/global.height)

if name="Mr. Saturn" {
	draw_set_font(fnt_saturn)
} else {
	draw_set_font(fnt_main);
}

draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);

draw_set_color(c_black);

// draw letterbox margins
if(letterbox) {
	draw_rectangle(camera_get_view_x(view),camera_get_view_y(view),camera_get_view_x(view)+global.width-1,camera_get_view_y(view)+margt, 0);
	draw_rectangle(camera_get_view_x(view),-1+camera_get_view_y(view)+global.height,camera_get_view_x(view)+global.width-1,-1+global.height+camera_get_view_y(view)-margb, 0);
}

if (global.box_style == spr_paperbox) {
	draw_set_color(c_black);
} else {
	draw_set_color(c_white);
}

// Draw window
draw_nineslice(global.box_style,global.box_color,xlocked,ylocked+anim_offset,xlocked+width,ylocked+height+anim_offset);

if(string_char_at(current_message,msg_prog) == " ") {
		last_space = msg_prog;
}

//add smart returns
var text_words = scr_string_copy_words(current_message,1,msg_prog);
if(string_width(text_words) >= width-12-string_width("A")) {
		// remove space and replace with return
		current_message = string_delete(current_message, last_space, 1);
		current_message = string_insert("\n  ", current_message, last_space);
}

var str = string_copy(current_message,0,msg_prog);

current_height = clamp(string_height_ext(str,line_space, width),0,(max_line_height*lines)-1) + 1;
//get vis text

if(surface_exists(surface)) {
	//get the text
	surface_set_target(surface);
	draw_clear_alpha(c_black,0)
	
	//draw the actual text
	draw_text_ext(dot_x_position,current_height,str, line_space, width);
	if(!is_undefined(value)) {
		// Get player input, usually yes/no
		if(string_copy(value,1,8) == "@prompt:" && msg_prog == string_length(current_message)+1) {
			draw_text_ext(indent_x_position,current_height + line_space,yes, line_space, width)
			
			draw_text_ext(indent_x_position+(width*.25)+string_width(yes),current_height + line_space,no, line_space, width)
			
			if(t) tpos += ((indent_x_position -tpos) * .40) else tpos += (((indent_x_position+(width*.25)+string_width(yes)) -tpos) * .40);
			
			tpos = clamp(tpos,indent_x_position,indent_x_position+(width*.25)+string_width(yes))
			
			draw_sprite(spr_cursor,1,tpos-9+floor(sin(get_timer()/200000)*1.125),current_height+1)	

			if(left_press || right_press) {
				t = !t;
				audio_play_sound(snd_menu2, 10, false);
			}
			
			if(action_press) {
				audio_play_sound(snd_menu1, 10, false);
			}
			
		} else if (string_copy(value,1,9) == "@show_win") {
			audio_stop_all();
			audio_play_sound(snd_enemywin, 10, false);
			draw_sprite(spr_win,0,width/2,(height/3.5)-1);
			draw_sprite(spr_cursor,0,width-19,height-29+floor(sin(get_timer()/200000)*1.125))
		} else if(msg_prog = string_length(current_message)+1 || show_prompt) {
			draw_sprite(spr_cursor,0,width-19,height-29+floor(sin(get_timer()/200000)*1.125))	
		}
		
	}
	surface_reset_target();
	//actually draw
	scr_transform_draw(xlocked,ylocked+text_box_border+anim_offset,0,0,0,1,1)
	
	draw_surface(surface,0,0);
	//If we have a name for this dialog box, create the name space and write the name out
	if(name != "") then draw_sprite(spr_name_tab,0,name_box_x_position, name_box_y_position);
	draw_text(name_x_position, name_y_position, name);
	scr_transform_reset()
	
} else {
	surface = surface_create(width,height);
	surface_set_target(surface);
	draw_clear_alpha(c_black,0)
	surface_reset_target();
}