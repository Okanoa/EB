var dialog_string = argument0;

var open_character = "{";
var close_character = "}";
var first_char = 0;

if(is_undefined(dialog_string)) exit;

// handle indentation formatting
dialog_string = string_replace_all(dialog_string, "\n", "\n  ");

// Add intentation if the line doesn't start with an @ sign and doesn't start with a command
if(string_char_at(dialog_string, 1) != "@") && (string_char_at(dialog_string, 1) != open_character) {
	dialog_string = "  " + dialog_string;
}

// Make sure all @ signs occur on their own line

var full_length = string_length(dialog_string);

var short_string = "";

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
		short_string = short_string + scr_replace_command(command);
	}
	// Here we check for the @ sign and put it on its own line, but ONLY if it is in the middle of the string
	else if(string_char_at(dialog_string, i) == "@") && first_char > 0 {
		short_string = short_string + "\n@";
	}
	// Here we add a normal character to the short string AND set the first normal character location if it's not set yet
	else {
		if(first_char == 0) first_char = i;
		short_string = short_string + string_char_at(dialog_string, i);
	}
}

// This short string is the string with all text replacement commands replaced
return short_string;
