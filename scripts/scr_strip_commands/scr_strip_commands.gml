var dialog_string = argument0;

if(is_undefined(dialog_string)) exit;

var full_length = string_length(dialog_string);

var open_character = "{";
var close_character = "}";

var short_string = "";

for(var i = 1; i < full_length + 1; i++) {
	if(string_char_at(dialog_string, i) == open_character) {
		while(string_char_at(dialog_string, i) != close_character) {
			i++;
		}
	}
	else {
		short_string = short_string + string_char_at(dialog_string, i);
	}
}

return short_string;
