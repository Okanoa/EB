/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(global.action_button) && (distance_to_object(obj_player) < 3)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Starman Jr.");
	scr_add_dialogue(myDialogue,"@There you are.");
	scr_add_dialogue(myDialogue,"@Buzz Buzz, it's been a long time.");
	scr_add_dialogue(myDialogue,"@For the most part, you've been successful at foiling the plans of Master Giygas.");
	scr_add_dialogue(myDialogue,"@But now, Buzz Buzz, this is the end of the line for you.");
	scr_add_dialogue(myDialogue,"@Surrender now, or I will foil your own plans.");
	scr_add_dialogue(myDialogue,"@newbox:Buzz Buzz");
	scr_add_dialogue(myDialogue,"@Not if the Chosen One is already alerted of the dark future!");
	scr_add_dialogue(myDialogue,"@I won't let you eradicate this young boy!");
	scr_add_dialogue(myDialogue,"@newbox:Starman Jr.");
	scr_add_dialogue(myDialogue,"@Pathetic.");
	scr_add_dialogue(myDialogue,"@You're no longer a hero -- {pause}you're just a useless insect.");
	scr_add_dialogue(myDialogue,"@I'll stomp you hard and take the Chosen One as my victory prize!");
	scr_play_dialogue(myDialogue);
}