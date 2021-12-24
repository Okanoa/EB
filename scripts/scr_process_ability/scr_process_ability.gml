/// @description Takes parameters for an attack and determines what strings should be processed to execute abilities
/// @param user	The ability user's data map, such as the data in enemies.json
/// @param type	The type of the ability. Defined in battle_abilities.json
/// @param text	The text for the ability. Defined in battle_abilities.json
/// @param target	(optional) The target that the ability is meant to be used on

var user = argument[0];
var type = argument[1];
var text = argument[2];

var target_name = "";
var target_index = -1;
var user_index = ds_map_find_value(user, "index");
// Since not everything needs a target, this is essentially optional
if(argument_count > 3) var target = argument[3]; else var target = noone;

// Setup the USER
var user_name = ds_map_find_value(user, "name");
var damage = string(ds_map_find_value(user, "offense"));
if ds_map_find_value(user, "the") user_name = "The " + user_name;


// Get new string stuff ready
var new_text = ds_list_create();
ds_list_copy(new_text, text);

// Get the target's info
if(target != noone) {
	target_name = ds_map_find_value(target, "name");
	target_index = ds_map_find_value(target, "index");
}

for(var k = 0; k < ds_list_size(new_text); k++) {
	new_text[| k] = string_replace_all(new_text[| k], "USERINDEX", user_index);
}

switch (type) 
{
	case "PHYSICAL":
		for(var i = 0; i < ds_list_size(new_text); i++)
		{
			new_text[| i] = string_replace_all(new_text[| i], "USERNAME", user_name);
			if (target != noone) {
				new_text[| i] = string_replace_all(new_text[| i], "TARGETNAME", target_name);
			}
			new_text[| i] = string_replace_all(new_text[| i], "TARGETINDEX", string(target_index));
			new_text[| i] = string_replace_all(new_text[| i], "DAMAGE", damage);
		}
		break;
	case "IDLE":
		for(var i = 0; i < ds_list_size(new_text); i++)
		{
			new_text[| i] = string_replace(new_text[| i], "USERNAME", user_name);
		}
		break;
}

return new_text;