

keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyActivate = keyboard_check(vk_enter) || keyboard_check(ord("Z"));

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);


if(keyActivate) 
{	
	
	
	if (!(whocollided == -1))
	{
		if (storechoice == -1) 
		{
			if (waittime == false)
			{
				global.state = 2;
			}
			else
			{
				global.state = 1;
			}
		}
		else
		{
			global.state = 3;
		}
	}
	else
	{
		
			global.state = 1;	
		
	}
}

switch(global.state)
{
	
	case 0:
	
		
	
	break;
	
	case 1:
	
		scr_playerstatefree();
	
	break;
	
	case 2:
	
		if !(instance_exists(textbox_obj))
		{
			create_textbox(whocollided);
		}
		
	
	break;
	
	case 3:
	
		if !(instance_exists(textbox_obj))
		{
			create_textbox(storechoice);
			storechoice = -1;
		}
		
		
	break;	
}



if(place_empty(x, y, interactiveparent_obj))
{
	whocollided = -1;
}



			


