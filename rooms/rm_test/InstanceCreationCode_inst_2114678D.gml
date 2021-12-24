name = "King";
npc_sprite = spr_king_walk6;
talknpc_sprite = spr_king_walk6;
image_speed = 0;

if(keyboard_check_pressed(global.action_button) && (distance_to_object(obj_player) < 3)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@I don't want to go out anymore.");
	scr_add_dialogue(myDialogue,"@I don't care if anyone thinks that I'm a stubborn old mutt.");
	scr_play_dialogue(myDialogue);
}