isABoss = false;
if(instance_find(obj_camera, 0).in_battle == false)
	instance_create_depth(0, 0, 1, obj_battle_transition);
enemy_sprite_id = 181;
battle_music = m_mechanicalfoe;