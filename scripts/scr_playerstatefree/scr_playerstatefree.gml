// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerstatefree(){

	hSpeed = round(lengthdir_x(inputMagnitude*speedWalk,inputDirection));
	vSpeed = round(lengthdir_y(inputMagnitude*speedWalk,inputDirection));

	scr_playercollision();

	

	if (inputMagnitude != 0) 
	{
		direction = inputDirection;
	
		if(keyLeft)  
		{
			sprite_index = spr_lonna_left;
			
			idlepose = 3;
			
		}
		if(keyRight)
		{
			sprite_index = spr_lonna_right;
			
			idlepose = 2;
		
		}
		if(keyUp) 
		{
			sprite_index = spr_lonna_up;
			
			idlepose = 1;
			
		}
		if(keyDown)
		{
			sprite_index = spr_lonna_down;
			
			idlepose = 0;
			
		}
		
		if(keyDown && keyLeft)
		{
			sprite_index = spr_lonna_diag_down_left;
			
			idlepose = 4;
			
		}
		
		if(keyDown && keyRight)
		{
			sprite_index = spr_lonna_diag_down_right;
		
			idlepose = 5;
			
		}
		
		if(keyUp && keyLeft)
		{
			sprite_index = spr_lonna_diag_up_left;
			
			idlepose = 6;
			
		}
		
		if(keyUp && keyRight)
		{
			sprite_index = spr_lonna_diag_up_right;
		
			idlepose = 7;
			
		}
	
	} else 
		{
			switch(idlepose)
			{
				case 0:
					sprite_index = spr_lonna_idle_down;
				
				break;
				
				case 1:
					sprite_index = spr_lonna_idle_up;
				
				break;
				
				case 2:
					sprite_index = spr_lonna_idle_right;
				
				break;
				
				case 3:
					sprite_index = spr_lonna_idle_left;
				
				break;
				
				case 4:
					sprite_index = spr_lonna_idle_diag_down_left;
				
				break;
				
				case 5:
					sprite_index = spr_lonna_idle_diag_down_right;
				
				break;
				
				case 6:
					sprite_index = spr_lonna_idle_diag_up_left;
				
				break;
				
				case 7:
					sprite_index = spr_lonna_idle_diag_up_right;
				
				break;
			
			
			}
			
		}
		
		
		

}