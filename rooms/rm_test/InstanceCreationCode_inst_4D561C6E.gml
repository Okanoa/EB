name = "Mom";
npc_sprite = spr_mom_walk6;
talknpc_sprite = spr_mom_walk6;
image_speed = 0;

if(keyboard_check_pressed(global.action_button) && place_meeting(x,y,obj_player)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Mom");
	scr_add_dialogue(myDialogue,"@You're back!");
	scr_add_dialogue(myDialogue,"@Don't bother yourself with talking now...{pause} you look too tired.");
	scr_add_dialogue(myDialogue,"@Mothers understand these things.{pause} Eat some steak and scoot up to bed.");
	scr_play_dialogue(myDialogue);
}