if(other.invulnerable_timer == 0 && !instance_exists(obj_battle_transition)) {
	isABoss = boss;
	instance_create_depth(0, 0, 1, obj_battle_transition);
	enemy_sprite_id = battle_sprite_id;
	battle_music = music;
	ds_list_add(global.enemies, ds_map_find_value(global.enemy_data, data_id));
	if(boss) {
		audio_play_sound(snd_oncomingboss, 10, false);
	} else {
		audio_play_sound(snd_oncomingfoe, 10, false);
	}
}