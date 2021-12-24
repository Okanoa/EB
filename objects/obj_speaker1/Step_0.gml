/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_dialogue_system)) {
halt = 2;	
}
//halt--
if(keyboard_check_pressed(global.action_button) && place_meeting(x,y,obj_player)) {
	myDialogue = scr_create_dialogue();
	scr_add_dialogue(myDialogue,@"{hide_dialog}{stop_player_follow}
	{pan:300;500;1640;867;1839}{pause:220} {flyover:The year is 199X}{pause:300} 
	{pan:300;2179;2378;2442;2246}{pause:220} {flyover:Onett, a small town in Eagleland}{pause:300} 
	{pan:450;4600;750;4400;180}{pause:500} {flyover:Ness's house}{pause:300} 
	{look_at:300;1880;50}{pause:300} 
	{start_player_follow}{kill_dialog}");
	scr_play_dialogue(myDialogue);
}