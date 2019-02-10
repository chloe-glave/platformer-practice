/// @description Main Code

#region //Sprite Changes
if global.ntele = 4
{
	sprite_index = sCharge4
}

else if global.ntele = 3
{
	sprite_index = sCharge3
}

else if global.ntele = 2
{
	sprite_index = sCharge2
}

else if global.ntele = 1
{
	sprite_index = sCharge1
}

else if global.ntele = 0
{
	sprite_index = sCharge0
}
#endregion


//If following an object, lock onto its coords
if (follow != noone)
and instance_exists(follow)
{
	xTo = follow.x - 375;
	yTo = follow.y - 325;
}

//Follow
x = x + (xTo - x)
y = y + (yTo - y)