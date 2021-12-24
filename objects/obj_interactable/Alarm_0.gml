/// @description Insert description here
// You can write your code in this editor

if ds_map_exists(global.npc_data,npcID) {
	npcDSMAP = global.npc_data[? npcID]//asset_get_index(npc)
}

if ds_map_exists(npcDSMAP,"NPC-CREATEFLG") {
	if !ds_map_exists(global.eventflags,npcDSMAP[? "NPC-CREATEFLG"]) { instance_destroy() }
}

if ds_map_exists(npcDSMAP,"NPC-SPRITE") {
	sprite_group = npcDSMAP[? "NPC-SPRITE"]
}
if ds_map_exists(npcDSMAP,"NPC-DIRECTION") {
	switch (npcDSMAP[? "NPC-DIRECTION"]) {
		case "up":
			dir = up_dir
		break;
		case "down":
			dir = down_dir
		break;
		case "left":
			dir = left_dir
		break;
		case "right":
			dir = right_dir
		break;
		case "up_right":
			dir = up_right_dir
		break;
		case "up_left":
			dir = up_left_dir
		break;
		case "down_right":
			dir = down_right_dir
		break;
		case "down_left":
			dir = down_left_dir
		break;
	}
}

if ds_map_exists(npcDSMAP,"NPC-MOVETYPE") {
	movetype = npcDSMAP[? "NPC-MOVETYPE"]
}
