

//pause the game
if(keyboard_check_pressed(vk_escape)) 
{
	global.gamePaused = !global.gamePaused;
	
	if(global.gamePaused == true)
	{
		global.state = 4;
	} else
	{
		
		global.state = 1;
		instance_destroy(obj_ingamemenu);
	}
	
}