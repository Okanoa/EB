name = "Tracy";
npc_sprite = spr_tracy_walk6;
talknpc_sprite = spr_tracy_talk6;
image_speed = 0;

if(keyboard_check_pressed(global.action_button) && (distance_to_object(obj_player) < 3)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@Brother Ness...");
	scr_add_dialogue(myDialogue,"@Guess where I work at?");
	scr_add_dialogue(myDialogue,"@Escargo Express!");
	scr_play_dialogue(myDialogue);
}