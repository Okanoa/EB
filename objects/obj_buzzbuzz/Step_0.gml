/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(vk_enter) && (distance_to_object(obj_player) < 3)) {
	audio_stop_all();
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Buzz Buzz");
	scr_add_dialogue(myDialogue,"@{sound:m_buzzbuzz}A bee I am...");
	scr_add_dialogue(myDialogue,"@...not...");	
	scr_add_dialogue(myDialogue,"@I am no mere bee.");
	scr_add_dialogue(myDialogue,"@I've come here from ten years in the future...");
	scr_add_dialogue(myDialogue,"@...and in the future, all is devastation and ruin...");
	scr_add_dialogue(myDialogue,"@The universal cosmic destroyer known as Giygas sent all to the horror of eternal darkness.");
	scr_add_dialogue(myDialogue,"@However, I implore you to listen.");
	scr_add_dialogue(myDialogue,"@In my era, a prophecy has been handed down from the times of old.");
	scr_add_dialogue(myDialogue,"@It is prophesied that, \"When the chosen boy reaches the point, he will find the light.");
	scr_add_dialogue(myDialogue,"@The passing of time will shatter the rock of nightmares and reveal the path of light.\"");
	scr_add_dialogue(myDialogue,"@Ah, you must be wondering what I am referring to, is that right, Ness?");
	scr_add_dialogue(myDialogue,"@What?");
	scr_add_dialogue(myDialogue,"@You seem surprised that I know your name.");
	scr_add_dialogue(myDialogue,"@Well, it is my strong belief, Ness, that you are this chosen boy.");
	scr_add_dialogue(myDialogue,"@Yes...");
	scr_add_dialogue(myDialogue,"@Giygas must have set his monstrous plans in motion somewhere on Earth...");
	scr_add_dialogue(myDialogue,"@If you begin to confront the fiend posthaste,");
	scr_add_dialogue(myDialogue,"@you may have time to counter Giygas's evil intentions.");
	scr_add_dialogue(myDialogue,"@You must remember three significant virtues on your adventure.");
	scr_add_dialogue(myDialogue,"@They are: {pause}Wisdom. {pause}Courage. {pause}Friendship.");
	scr_add_dialogue(myDialogue,"@The legends from ancient days speak of three boys and one girl who band together and bring an end to Giygas and his plans.");
	scr_add_dialogue(myDialogue,"@I will reveal more later.");
	scr_add_dialogue(myDialogue,"@Go now, and do not cling to uncertainty about the future.");
	scr_add_dialogue(myDialogue,"@You have much work to do, Ness.");
	scr_add_dialogue(myDialogue,"@newbox:Buzz Buzz");
	scr_add_dialogue(myDialogue,"@Do you understand?\n%n");
	scr_add_dialogue(myDialogue,"@prompt:3&Yes%No");
	scr_play_dialogue(myDialogue);
}