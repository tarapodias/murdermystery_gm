if (obj_player.whocollided == -1)
{
	obj_player.whocollided = "desk";
}

if (!instance_exists(obj_textbox)) 
{
	obj_player.whocollided = "desk";
}