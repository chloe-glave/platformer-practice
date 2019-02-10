///@description Room Navigation for Tests

//Keyboard Checks
key_restart = keyboard_check_pressed(ord("R"))
key_forward = keyboard_check_pressed(vk_end)
key_backward = keyboard_check_pressed(vk_home)


//Restart
if key_restart = true
{
	room_restart()
}

//Skips
if key_backward = true
{
	room_goto_previous()
}

if key_forward = true
{
	room_goto_next()
}