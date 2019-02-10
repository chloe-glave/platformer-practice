///@description Tele Charges

//Initial Recharge
global.ntele = global.ntele + 1;

//Subsequent if Needed
if global.ntele < 4
{
	alarm[3] = 1*room_speed;
}