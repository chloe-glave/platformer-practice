///@description Main Code

//Player Interaction
if (place_meeting(x-1,y-1,oPlayer))
{
	global.pdead = true;
	alarm[0] = 1.5*room_speed;
}

