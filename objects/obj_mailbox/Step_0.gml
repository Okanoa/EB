/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(vk_enter) && place_meeting(x,y,obj_player)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,"@There's a magazine inside the mailbox.");
	scr_add_dialogue(myDialogue,"@It reads,{pause} \"My Secret Life,{pause} chapter three.\"\n(Story from the previous chapter.)");
	scr_add_dialogue(myDialogue,"@newbox:");
	scr_add_dialogue(myDialogue,"@I was neither a murder suspect,{pause} nor a target for an international spy organization.");
	scr_add_dialogue(myDialogue,"@But I drove a car down the Jersey Turnpike at 80 mph.");
	scr_add_dialogue(myDialogue,"@...A police officer pulled me over and asked for my driver's license.");
	scr_add_dialogue(myDialogue,"@He said I was going 20 mph over the speed limit.");
	scr_add_dialogue(myDialogue,"@I instantly pointed to my wife and said, \"I'm in a hurry,{pause} my wife is in labor.\"");
	scr_add_dialogue(myDialogue,"@Fortunately,{pause} my wife actually had a big stomach.");
	scr_add_dialogue(myDialogue,"@I hoped he'd let me go with this excuse.");
	scr_add_dialogue(myDialogue,"@\"Oh, since it's an emergency,{pause} I'll lead you to the hospital with my police car,\" he said.");
	scr_add_dialogue(myDialogue,"@\"No,{pause} it's not necessary.\"");
	scr_add_dialogue(myDialogue,"@\"Why not?\"{pause} asked the officer.");
	scr_add_dialogue(myDialogue,"@\"Uh...{pause} well...\"{pause}");
	scr_add_dialogue(myDialogue,"@\"Let's get going,\"{pause} said the officer...");
	scr_add_dialogue(myDialogue,"@\"No,{pause} no!{pause} We can't!{pause}\nThis baby is a demon child!\"");
	scr_play_dialogue(myDialogue);
}