/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(global.action_button) && place_meeting(x,y,obj_player)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Okano");
	scr_add_dialogue(myDialogue,"@Oh.{pause}.{pause}.{pause}. It's you{shake:10,4}!{sound:snd_suspicious}");
	scr_add_dialogue(myDialogue,"@Hello, there this textbox is pretty cool I think. One cool thing it can do is talk like this.");
	scr_add_dialogue(myDialogue,"@But every textbox can do that. This one, however, can scroll... Watch this.\nV\nV\nV@Woah this page is jam-packed let's make a new one.");
	scr_add_dialogue(myDialogue,"@newbox:Okano");
	scr_add_dialogue(myDialogue,"@Ah, this is much nicer.");
	scr_add_dialogue(myDialogue,"Oh yeah, I have a question, Do you like jazz?%n");
	scr_add_dialogue(myDialogue,"@prompt:0&Heck yes!%No way!");
	scr_play_dialogue(myDialogue);
}