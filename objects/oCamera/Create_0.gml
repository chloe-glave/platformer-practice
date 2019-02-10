///@description Variable Setup

//Create Camera
camera = camera_create();


//Create View Matrix
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);

//Create Projection Matrix
var pm = matrix_build_projection_ortho(1024,768,1,10000);


//Set Matrices
camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);


//Assign Cam to Viewport
view_camera[0] = camera;


//Choose Object to Follow
follow = oPlayer;


//Start Cam where Placed in Room
xTo = x;
yTo = y;