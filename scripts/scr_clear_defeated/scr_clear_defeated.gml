if(global.combat_won) {
	for(var i = 0; i < ds_list_size(global.enemy_objects); i++) {
		instance_destroy(global.enemy_objects[| i]);
	}
}

ds_list_clear(global.enemy_objects);
global.combat_won = false;