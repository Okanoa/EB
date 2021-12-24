/// @description Takes enemy data and inserts it into an encounter string
/// @param user	The ability user's data map, such as the data in enemies.json
/// @param text	The text for the encounter. Defined in battle_text.json

var user = argument[0];
var text = argument[1];

var user_name = ds_map_find_value(user, "name");
var user_pre_article = ds_map_find_value(user, "pre_article");
var user_posessive_pronoun = ds_map_find_value(user, "possessive_pronoun");

var final_text = string_replace_all(text, "PREARTICLE", user_pre_article);
final_text = string_replace_all(final_text, "ENEMYNAME", user_name);
final_text = string_replace_all(final_text, "ENEMYPRONOUN", user_posessive_pronoun);

final_text = string_upper(string_copy(final_text, 1, 2)) + string_copy(final_text, 3, string_length(final_text) - 2);

return final_text;