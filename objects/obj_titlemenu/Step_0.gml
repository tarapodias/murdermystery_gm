accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
scroll_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
scroll_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
back_key = keyboard_check_pressed(vk_rshift) || keyboard_check_pressed(ord("X"));

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += scroll_down - scroll_up;
if (pos >= op_length)
{
	pos = 0;
}
if (pos < 0)
{
	pos = op_length-1;
}

//select option
if (accept_key) 
{
	var _startmenulevel = menu_level;
	
	switch(menu_level)
	{
		case 0: //start menu
			switch(pos)
			{
				case 0: room_goto(ROOM_START); break; //new game
		
				case 1:		break; //continue game from save
		
				case 2: menu_level = 1; break; //open settings menu
		
				case 3: game_end(); break; //exit the game/program completely
	
			}
		break;
		
		case 1: //settings menu
			switch(pos)
			{
				case 0:  break; //window size
		
				case 1:		break; //brightness
		
				case 2:  break; //controls
		
				case 3: menu_level = 0; break; //go back to start menu
	
			}
		
		break;
		
		
		
	}
	
	if (_startmenulevel != menu_level)
	{
		pos = 0;
	}
	
	//store number of options in current menu
	op_length = array_length(option[menu_level]);

}
