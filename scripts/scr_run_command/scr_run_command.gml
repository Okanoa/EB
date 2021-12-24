var yes = argument0;
var no = argument1;
var tf = argument2;

var usekey = ""

if tf {
	usekey = yes
} else {
	usekey = no	
}

var text = noone;
var npcDSMAP = global.npc_data[? jsonkey]

text = npcDSMAP[? usekey] 

if text != undefined {
	var priority = ds_list_size(text) + 1;

	priority--;
	for (i = 0; i < ds_list_size(text); i++){
	    scr_add_dialogue(dialogue, text[| i], priority);
		priority--;
	}
	
} else {
	show_debug_message("\nWARNING KEY NOT DEFINED: "+usekey)	
}