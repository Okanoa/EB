// We use User Event 0 to run interactions with NPCs

/// @description Insert description here
// You can write your code in this editor

var txtflag = ""

if array_length_1d(npcFLAG) <= 0 {
	text = npcDSMAP[? "default"]
} else {
	for(var j = 0; j < array_length_1d(npcFLAG); j++) {
		txtflag += flagcheck(npcFLAG[j])
	}
	show_debug_message("ke\n"+txtflag)
	text = npcDSMAP[? txtflag];
}

var priority = ds_list_size(text) + 1;

myDialogue = scr_create_dialogue();
priority--;
for (i = 0; i < ds_list_size(text); i++){
    scr_add_dialogue(myDialogue, text[| i], priority);
	priority--;
}

scr_play_dialogue(myDialogue);