

////pause the game
if !(global.state == 2 || global.state == 3)
{
	if(keyboard_check_pressed(ord("C"))) 
	{
		show_debug_message(global.gamePaused);
		global.gamePaused = !global.gamePaused;
		show_debug_message(global.gamePaused);

		if(global.gamePaused == true)
		{
			show_debug_message("the state should change");
			global.state = 4;
		} else
		{
		
			global.state = 1;
			instance_destroy(obj_ingamemenu);
		}
	
	}
}