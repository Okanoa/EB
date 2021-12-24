/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(vk_enter) && (distance_to_object(obj_player) < 3)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@Get into the Instant Revitalizing Device?\n%n");
	scr_add_dialogue(myDialogue,"@prompt:4&Yes%No");
	scr_play_dialogue(myDialogue);
}