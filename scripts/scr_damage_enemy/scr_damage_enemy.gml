/// @description	Damages an enemy
/// @param enemy	The enemy index that is to be damaged
/// @param damage	The amount of damage to do

var enemy = real(argument[0])
var damage = real(argument[1])

var enemy_map = global.enemies[| enemy];
var current_hp = real(ds_map_find_value(enemy_map, "current_hp")) - damage;

if(current_hp <= 0) {
	//Enemy defeated
	ds_list_delete(global.enemies, enemy);
	ds_list_delete(enemy_positions,beat_target);
} else {
	ds_map_set(enemy_map, "current_hp", current_hp);
}

var batdam = instance_create_depth(ds_map_find_value(enemy_map, "xpos"), ds_map_find_value(enemy_map, "ypos"), -10000, battle_damage);
batdam.damage = string(damage);
		var enemy_position = ds_list_find_value(enemy_positions, beat_target);
		enemy_position[3] = choose(-10,10);
		enemy_positions[| beat_target]=enemy_position

if(ds_list_size(global.enemies) == 0) {
	global.combat_won = true;
	//run();
	
}