/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(global.action_button) && (distance_to_object(obj_player) < 3)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@newbox:Frank");
	scr_add_dialogue(myDialogue,"@Yo.");
	scr_add_dialogue(myDialogue,"@Call me Frank, as in Frank Fly.");
	scr_add_dialogue(myDialogue,"@You are?");
	scr_add_dialogue(myDialogue,"@...What's the matter, can't tell me your name?");
	scr_add_dialogue(myDialogue,"@Then I'll make you talk!");
	scr_add_dialogue(myDialogue,"@newbox:Frank");
	scr_add_dialogue(myDialogue,"@Unbelievable.");
	scr_add_dialogue(myDialogue,"@'Failproof' Frank just got his butt kicked...");
	scr_add_dialogue(myDialogue,"@Guess I can't call myself 'failproof' anymore.");
	scr_add_dialogue(myDialogue,"@So, what do you need to know?");
	scr_add_dialogue(myDialogue,"@What? {pause}You want to know about Giant Step?");
	scr_add_dialogue(myDialogue,"@Huh, somehow I get the feeling you've asked around about this...");
	scr_add_dialogue(myDialogue,"@Well, okay, since you beat me fair and square, I guess I can tell you what I know.");
	scr_add_dialogue(myDialogue,"@newbox:Frank");
	scr_add_dialogue(myDialogue,"@Giant Step... {pause} seems to be quite a powerful place.");
	scr_add_dialogue(myDialogue,"@No, really.");	
	scr_add_dialogue(myDialogue,"@That is, there's some kind of power that's stored there that allows those who can assimilate it to perform many wondrous feats.");
	scr_add_dialogue(myDialogue,"@But the sad part is, some kind of monster's believed to have sucked up all the energy there.");
	scr_add_dialogue(myDialogue,"@All's I know is, it's a trife hard to get up there now.");
	scr_add_dialogue(myDialogue,"@It's probably best to gather up some more info on your own.");
	scr_add_dialogue(myDialogue,"@In case you're wondering, the way to Giant Step is behind that old shack used by those touring entertainers.");
	scr_add_dialogue(myDialogue,"@You know, that place in the northwest that's been locked up?");
	scr_add_dialogue(myDialogue,"@I think you can get the key from our hack of a mayor, that Bertram Horace Pickle.");
	scr_add_dialogue(myDialogue,"@I gotta say, Ness...");
	scr_add_dialogue(myDialogue,"@I might be a few years older than you, but you're much stronger than I am.");
	scr_add_dialogue(myDialogue,"@Whatever adventure you're on is only just beginning...");
	scr_play_dialogue(myDialogue);
}