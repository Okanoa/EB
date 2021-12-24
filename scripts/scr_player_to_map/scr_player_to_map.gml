/// @description Takes the indicated player and creates a data map with their current state
/// @param player_num The number of the player that needs to be used: 0 for Ness, 1 for Paula, 2 for Jeff, 3 for Poo

var player_num = argument0;
var player_map = ds_map_create();

ds_map_add(player_map, "hp", global.stats[# player_num, 3]);
ds_map_add(player_map, "pp", global.stats[# player_num, 6]);
ds_map_add(player_map, "offense", global.stats[# player_num, 9]);
ds_map_add(player_map, "defense", global.stats[# player_num, 10]);
ds_map_add(player_map, "speed", global.stats[# player_num, 11]);
ds_map_add(player_map, "guts", global.stats[# player_num, 12]);
ds_map_add(player_map, "luck", global.stats[# player_num, 13]);
ds_map_add(player_map, "name", global.stats[# player_num, 17]);
ds_map_add(player_map, "the", false);
ds_map_add(player_map, "index", player_num);

if(player_num == 1) {
	ds_map_add(player_map, "gender", "female");
} else {
	ds_map_add(player_map, "gender", "male");
}

return player_map;