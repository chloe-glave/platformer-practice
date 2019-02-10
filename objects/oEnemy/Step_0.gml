///@description Main Code

//Gravity & Direction
vsp = vsp + grv;


//Horizontal Collision & Turnarounds
if (place_meeting(x+dir,y,oWall))
{
	dir = dir*(-1);
}


//Vertical Collision & Edge Interaction
if (place_meeting(x,y+vsp,oWall))
{
	vsp = 0;
	if not place_meeting(x+(abs(sprite_width))*dir, y+(sprite_height), oWall) 
	{
		dir = dir*(-1);
	}
}


//Player Interaction
if (place_meeting(x-1,y-1,oPlayer))
{
	global.pdead = true;
	alarm[0] = 1.5*room_speed;
}


//Bullet Interaction
if (place_meeting(x,y,oBullet))
{
	instance_destroy();
	instance_destroy(oBullet);
}


//Movement & Animation
image_xscale = dir;
x = x + hsp*dir;
y = y + vsp;