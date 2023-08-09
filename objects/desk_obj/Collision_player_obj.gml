if (player_obj.whocollided == -1)
{
	player_obj.whocollided = "desk";
}

if (!instance_exists(textbox_obj)) 
{
	player_obj.whocollided = "desk";
}