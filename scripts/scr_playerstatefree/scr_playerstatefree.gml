// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerstatefree(){

	hSpeed = lengthdir_x(inputMagnitude*speedWalk,inputDirection);
	vSpeed = lengthdir_y(inputMagnitude*speedWalk,inputDirection);

	scr_playercollision();


	if (inputMagnitude != 0) 
	{
		direction = inputDirection;
	
		if(keyLeft)  
		{
			sprite_index = lonnaleft_spr;
		}
		if(keyRight)
		{
			sprite_index = lonnaright_spr;
		}
		if(keyUp) 
		{
			sprite_index = lonnaup_spr;
		}
		if(keyDown)
		{
			sprite_index = lonnadown_spr;
		}
	
	} else 
		{
			sprite_index = lonnaidle_spr;
		}
		
		
		

}