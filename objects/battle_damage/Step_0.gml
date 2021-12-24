/// @description Insert description here
// You can write your code in this editor

hspd = scr_approach(hspd, 0, 0.01);



if (yspd < max_yspd)
	yspd += grav;

x = x + hspd;
y = y + yspd;

timer --;
if(timer <= 0) {
	instance_destroy(self);
}