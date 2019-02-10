//Mouse Press and Placement Checks
if mouse_check_button_pressed(mb_left)
and mouse_x >= bbox_left and mouse_x <= bbox_right and mouse_y >= bbox_top and mouse_y <= bbox_bottom


//Player Not Touching Checks
{
	if not place_meeting(x+1,y,oPlayer)
	and not place_meeting(x-1,y,oPlayer)
	and not place_meeting(x,y+1,oPlayer)
	and not place_meeting(x,y-1,oPlayer)
	{
		dragging = true;
	}
}


//Mouse Not Pressed Check
else if not mouse_check_button(mb_left)
{
    dragging = false;
}


//Platform Follows Mouse
if dragging
{
    x = mouse_x;
	y = mouse_y;
}