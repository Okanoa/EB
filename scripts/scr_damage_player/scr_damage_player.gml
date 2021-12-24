/// @description	Damages the player
/// @param player	The player that is to be damaged
/// @param damage	The amount of damage to do

var s = global.stats;
var player = real(argument[0])
var damage = real(argument[1])

var shake_d = 15;
var shake_intensity = 2;

audio_play_sound(snd_bump,0,false);
with instance_find(obj_camera, 0) {
	shake = true;
	shake_duration = shake_d;
	shake_force = shake_intensity;
}

// TODO set this up to actually appear above the correct user's stats instead of always in the middle of the screen
with(instance_create_depth(global.width/2, global.height * 0.85, -15000, player_damage)) {
	dmg = damage;
}

s[# player, 18] = 10;
s[# player, 2] -= damage;