/// @description Insert description here
// You can write your code in this editor
if(active = 0 || active=1 || active = 3) {
count++;
if(count%61=60)
{
	hopdx = choose(-.5,-1,1,.5);
	hopdy = choose(-.5,0,.5);
	active = choose(1,3);
}

if(active=1)
{
	if(place_meeting(x+(hopdx*15),yreal,obj_solid))
	{
		hopdx = -hopdx
	}
	if(place_meeting(x,yreal+(hopdy*15),obj_solid))
	{
		hopdy = -hopdy
	}
	
	x+=hopdx
	yreal+=hopdy
	
	y=yreal-abs(sin(hcount/5))*10;
	hcount++;
	if hcount>15
	{
		active=0;
		hcount=0;
	}
	image_index=0;
}
if(active=3)
{
	hcount+=.25
	idx=(hcount)%2
	image_index=idx+1
	if hcount > 6
	{
		hcount=0
		active=0;
		idx=0
		image_index=0;
	}
}

if point_distance(x,yreal,camera_get_view_x(view)+global.width/2,camera_get_view_y(view)+global.height/2) < 64
{
	active=2
}
depth = -yreal;
} else {
	hopdx=1
	idx=(idx+.25)%3
	image_index=idx+3
	x+=sign(hopdx)*3;
	y-=2;
	depth = -(bbox_bottom+bbox_bottom);	
}


image_xscale=sign(hopdx);