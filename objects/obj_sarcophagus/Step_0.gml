/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--

if(keyboard_check_pressed(global.action_button) && (distance_to_object(obj_player) < 3)) {
	if (opened == 0) {
	    myDialogue = scr_create_dialogue();
	    scr_add_dialogue(myDialogue,"@newbox:");
	    scr_add_dialogue(myDialogue,"@{sound:snd_openpresent}Ness opened the sarcophagus.");
	    scr_add_dialogue(myDialogue,"@newbox:");
	    scr_add_dialogue(myDialogue,"@{sound:snd_getitem}Ness got a " + string(item_name) + "!");
	    scr_play_dialogue(myDialogue);
	    image_speed = 1;
		opened = 1;
	} else {
	    myDialogue = scr_create_dialogue();
	    scr_add_dialogue(myDialogue,"@newbox:");
	    scr_add_dialogue(myDialogue,"@It's empty...");
		scr_play_dialogue(myDialogue);
	}
}

if (image_index == 1) {
	image_speed = 0;
}