

depth = -100;
//collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;

whocollided = -1;
storechoice = -1;

global.state = 1;
waittime = false;
idlepose = 0;

if (!instance_exists(obj_camera))
{
	instance_create_depth(x, y, -1000, obj_camera);
}

