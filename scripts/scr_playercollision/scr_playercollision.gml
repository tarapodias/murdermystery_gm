// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playercollision(){

	var _collision = false;
	
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if(sign(hSpeed) == 1)
		{
			x += TILE_SIZE - 1;
		}
		hSpeed = 0;
		_collision = true;
	}
	
	x += hSpeed;
	
	
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if(sign(vSpeed) == 1)
		{
			y += TILE_SIZE - 1;
		}
		vSpeed = 0;
		_collision = true;
	}
	
	y += vSpeed;
	
	
	
	return _collision;


}