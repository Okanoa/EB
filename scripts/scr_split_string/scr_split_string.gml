/// @description takes a string and splits it using the provided delimiter
/// @param string_to_split the string that will be split
/// @param delimiter the string that should be used to split the string
/// modified from https://yal.cc/gamemaker-split-string/
var string_to_split = argument[0];
var delimiter = argument[1];
var return_list = ds_list_create();
var delimiter_index = string_pos(delimiter, string_to_split);
var current_position = 1;
var delimiter_length = string_length(delimiter);
var current_substring = string_to_split;

// If our delimiter is not empty, find string positions of the delimiter
if (delimiter_length) while (delimiter_index) {
    ds_list_add(return_list, string_copy(current_substring, 1, delimiter_index - 1));
	current_position = current_position + delimiter_index - 1 + delimiter_length;
	current_substring = string_copy(string_to_split, current_position, string_length(string_to_split) - (current_position - 2));
    delimiter_index = string_pos(delimiter, current_substring);
}
ds_list_add(return_list, current_substring);

return return_list;