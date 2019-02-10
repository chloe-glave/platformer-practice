///@description Main Code

//Mouse Press and Placement Checks
if mouse_check_button_pressed(mb_left)
and mouse_x >= bbox_left and mouse_x <= bbox_right and mouse_y >= bbox_top and mouse_y <= bbox_bottom

{
	room_goto(1)
}