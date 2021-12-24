var json_file = file_text_open_read(argument0);
//var enemy_json = file_text_read_string(enemy_file);
var fullFile = "";
while (!file_text_eof(json_file))
{
    fullFile += file_text_read_string(json_file);
    file_text_readln(json_file);
}
file_text_close(json_file);


var json = json_decode(fullFile);

if json = -1 { show_debug_message("FAILED TO MAKE JSON" + argument0) }

return json;