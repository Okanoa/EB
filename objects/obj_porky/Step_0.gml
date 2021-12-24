/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(vk_enter) && (distance_to_object(obj_player) < 3)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Porky");
	scr_add_dialogue(myDialogue,"{script_command:instance_make;4034;365;0;obj_bird}@Ness, you're so lucky...");
	scr_add_dialogue(myDialogue,"{face:obj_player;90}{pause:30}@I envy you. {face:obj_player;180}{pause:30} {face:obj_player;270}{pause:30} {face:obj_player;0}");
	scr_add_dialogue(myDialogue,"@{move:obj_porky;0;-1;20;1}.{pause}.{pause}.");
	scr_add_dialogue(myDialogue,"@I have no luck.");
	scr_add_dialogue(myDialogue,"@newbox:Porky");
	scr_add_dialogue(myDialogue,"@But Ness... well, okay...");
	scr_add_dialogue(myDialogue,"@{script_command:instance_make;4034;365;0;obj_bird}Let's be friends forever, all right?");
	scr_play_dialogue(myDialogue);
}