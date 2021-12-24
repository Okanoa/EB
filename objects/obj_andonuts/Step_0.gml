/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(vk_enter) && place_meeting(x,y,obj_player)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Dr. Andonuts");
	scr_add_dialogue(myDialogue,"@.{pause}.{pause}.{pause}");
	scr_add_dialogue(myDialogue,"@In order to defeat Giygas, who is attacking from the past,");
	scr_add_dialogue(myDialogue,"@you must warp to the past.");
	scr_add_dialogue(myDialogue,"@This can be done by way of the \"Phase Distorter 3.\"");
	scr_add_dialogue(myDialogue,"@However,{pause} the machine cannot warp living things,{pause} I mean lifeforms.");
	scr_add_dialogue(myDialogue,"@Life is demolished in the process of warping.");
	scr_add_dialogue(myDialogue,"@The only way to accomplish the time travel is to transfer your brain \"program\" into a robot,");
	scr_add_dialogue(myDialogue,"@{pause}and send the robot to the past.");
	scr_add_dialogue(myDialogue,"@.{pause}.{pause}.{pause}The transfer means that your spirit will go with the robot");
	scr_add_dialogue(myDialogue,"@while your body is left behind.{pause}.{pause}.{pause}");
	scr_add_dialogue(myDialogue,"@I cannot promise that your spirit will come back after the battle in the past.");
	scr_add_dialogue(myDialogue,"@Yet,{pause} you must understand that the four of you are the chosen ones.");
	scr_add_dialogue(myDialogue,"@newbox:Dr. Andonuts");
	scr_add_dialogue(myDialogue,"@Do you still wish to face Giygas by traveling to the past?%n");
	scr_add_dialogue(myDialogue,"@prompt:2&Yes%No");
	scr_play_dialogue(myDialogue,17,global.height-65,231,65-4,3);
}