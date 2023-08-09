if (updatetext == false)	
{
	if (obj_player.whocollided == -1)
	{
		obj_player.whocollided = "test";
	}
	if (!instance_exists(obj_textbox)) 
	{
		obj_player.whocollided = "test";
	}
}
else
{
	if (obj_player.whocollided == -1)
	{
		obj_player.whocollided = "test_updated";
	}
	if (!instance_exists(obj_textbox)) 
	{
		obj_player.whocollided = "test_updated";
	}
}