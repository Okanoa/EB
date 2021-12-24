/// @description Insert description here
// You can write your code in this editor
hspd = random_range(-2,2);
damage = "0";
grav = 0.25;
yspd = random_range(-5,-3);
max_yspd = 5;
timer = 90;

fx=choose(spr_basheffect1,spr_basheffect2);
startxy = [x+choose(-5,5),y+choose(-3,3)]
animtime=0;