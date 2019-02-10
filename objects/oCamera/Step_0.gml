///@description Main Code

// Make camera follow player
x = x + (xTo - x)/25
y = y + (yTo - y)/25


//Confine camera to room boundaries
x = clamp(x, (1024/2), room_width-(1024/2));
y = clamp(y, (768/2), room_height-(768/2));


//If following an object, lock onto its coords
if (follow != noone)
and instance_exists(follow)
{
	xTo = follow.x;
	yTo = follow.y;
}


//Update Coordinate Info
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);
