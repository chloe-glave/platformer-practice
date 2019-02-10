/// @description Main Code

#region Keyboard Checks
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

key_tele = keyboard_check_pressed(ord("Z"));
key_shoot = keyboard_check_pressed(vk_space);
#endregion


#region Direction Checks
if key_right = true
{
	global.pdir = 1;
}

if key_left = true
{
	global.pdir = (-1);
}
#endregion


#region Death Check
if global.pdead == true
{
	vsp = -7;
	
	sprite_index = sPlayer_Dead;
	alarm[2] = 0.5*room_speed;
	global.pdead = false;
}
#endregion


#region Movement
var move = key_right-key_left;
hsp = 5*move;

if float = false
{
	vsp = vsp+grv;
}
#endregion


#region Jumping
// Regular Jumps
if key_up = true
{
	if (place_meeting(x,y+1,oWall))
	{
		vsp = -10; // Jump
	}
	
	if not (place_meeting(x, y+1, oWall))
	{
		if (place_meeting(bbox_left, y, oWall)) or (place_meeting(bbox_right, y, oWall))
		{
			hsp *= -1; // Reverse x direction
			vsp = -10; // Jump
		}
	}
}

#endregion


#region Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while not (place_meeting(x+sign(hsp),y,oWall))
		{
		x = x + sign(hsp);
		}
	hsp = 0;
}
#endregion


#region Vertical Collison
if (place_meeting(x,y+vsp,oWall))
{
	while not (place_meeting(x,y+sign(vsp),oWall))
		{
		y = y + sign(vsp);
		}
	vsp = 0;
}
#endregion


#region Shooting
if key_shoot = true
{
	if shootdelay = false
	{
		instance_create_layer(x,y,"bullets",oBullet);
		shootdelay = true;
		alarm[1] = 1*room_speed;
	}
}
#endregion


#region Teleport (Orion's code)

if (key_right-key_left != 0)
{
	teledir = key_right-key_left;
}

teleend = false;

if global.ntele > 0
{
	if (key_down-key_up = 0)
	{
		if key_tele = true
		{
			while teleend = false
			{
				if (place_meeting(x + (tele*teledir) + (2*teledir),y,oWall)) or tele = 50
				{
					teleend = true;
				}
				tele = tele + 1;
			}
			global.ntele = global.ntele - 1;
			
			x = x + tele*teledir;
			
			vsp = 0;
			tele = -1;
			float = true;
			
			alarm[0] = 3;
			
			if global.ntele < 4
			{
				alarm[3] = 1*room_speed;
			}
			
		}
	}
	
	else
	{
		if key_tele = true
		{
			while teleend = false
			{
				if (place_meeting(x + (tele*(sign(hsp))) + (2*(sign(hsp))),y + (tele*(key_down-key_up)) + (2*(key_down-key_up)),oWall))
				or tele = 50

				{
					teleend = true;
				}
				tele = tele + 1;
			}
			global.ntele = global.ntele - 1;
			
			x = x + tele*sign(hsp);
			y = y + tele*(key_down-key_up);
			
			vsp = 0;
			tele = -1;
			float = true;
			
			alarm[0] = 3;

			if global.ntele < 4
			{
				alarm[3] = 1*room_speed;
			}
		}
	}
}

#endregion


#region Movement & Animations
image_xscale = global.pdir;
if sprite_index != sPlayer_Dead
{
	x = x + hsp;
}
y = y + vsp;
#endregion