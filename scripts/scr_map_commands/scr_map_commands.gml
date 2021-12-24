/// @description Takes a string and looks for any text that occur between the open_character and close_character and stores it in a ds_map as a command to be executed during text

var dialog_string = argument0;
var progress = argument1;
var a_map = argument2;

if(is_undefined(dialog_string)) exit;

var full_length = string_length(dialog_string);

var open_character = "{";
var close_character = "}";

var short_string_location = 1;

if progress > 0 short_string_location = progress;

for(var i = 1; i < full_length + 1; i++) {
	if(string_char_at(dialog_string, i) == open_character) {
		i++;
		var begin_command = i;
		while(string_char_at(dialog_string, i) != close_character) {
			i++;
		}
		var end_command = i;
		var count = end_command - begin_command;
		var command = string_copy(dialog_string, begin_command, count);
		if(ds_map_exists(a_map, short_string_location - 1)) {
			ds_list_add(ds_map_find_value(a_map, short_string_location - 1), command)
		} else {
			var new_list = ds_list_create();
			ds_list_add(new_list, command);
			ds_map_add(a_map, short_string_location - 1, new_list);
		}
	} else {
		short_string_location++;
	}

}

return a_map;