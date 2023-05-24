//pause the game
if(keyboard_check(vk_escape)) 
{
	global.gamePaused = !global.gamePaused;
	
	if(global.gamePaused)
	{
		with(all)
		{
			gamePausedImageSpeed = image_speed; //storing everythings current animation speed
			image_speed = 0;
		}
	}
	
}