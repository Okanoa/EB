/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(global.action_button) && place_meeting(x,y,obj_player)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:");
	scr_add_dialogue(myDialogue,"@{sound:snd_butterfly}The magic butterfly made Ness relax.");
	scr_play_dialogue(myDialogue);
}