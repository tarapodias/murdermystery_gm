
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
		
		
		case 0: 
			switch(pos)
			{
				case 0: menu_level = 1; break; //save menu
		
				case 1: menu_level = 2;	break; //load menu
		
				case 2: 
					global.gamePaused = false;
					global.state = 1;
					instance_destroy(self);
				break; //close menu
		
				case 3: 
					game_end();
				break; //quit game
	
			}
		
		break;
		
		case 1: //save to slot
			switch(pos)
			{
		
				case 0: save_game(0); break; //save 1
		
				case 1: save_game(1); break; //save slot 2
		
				case 2: save_game(2); break; //save slot 3
		
				case 3: menu_level = 0; break; //go back
				
			}
			
		break;	
		
		case 2: //continue from slot
			switch(pos)
			{
				case 0: load_game(0); break; //load slot 1
		
				case 1: load_game(1);	break; //load slot 2
		
				case 2: load_game(2); break; //load slot 3
		
				case 3: menu_level = 0; break; //go back 
				
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
