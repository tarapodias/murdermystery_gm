camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);
camera_width = camera_get_view_width(view_camera[0]);
camera_height = camera_get_view_height(view_camera[0]);
camera_border_x = camera_get_view_border_x(view_camera[0]);
camera_border_y = camera_get_view_border_y(view_camera[0]);

title_menu_x = camera_width/2
title_menu_y = camera_height/2
title_menu_w = sprite_get_width(titlemenusprite);
title_menu_h = sprite_get_height(titlemenusprite);

//draw menu background
draw_sprite(titlemenusprite, 0, title_menu_x, title_menu_y);

//draw menu options
draw_set_font(titlemenu_fnt);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if (pos == i)
	{
		_c = c_yellow;
	}
	
	draw_text_color(title_menu_x + op_border - title_menu_w/2, title_menu_y + op_border + op_space*i - title_menu_h/2 - 40, option[menu_level, i], _c, _c, _c, _c, 1);

}

if (instance_exists(obj_saveload))
{
	if (menu_level == 1)
	{
		for (var i = 0; i < 3; i++)
		{
			var _c = c_white;
			if (pos == i)
			{
				_c = c_yellow;
			}
			var which = i;
			load_time(which);
			draw_text_color(title_menu_x + op_border - title_menu_w/2 + 180, title_menu_y + op_border + op_space*i - title_menu_h/2 - 40, myTime(global.myplaytime[i]), _c, _c, _c, _c, 1);
		}
	}
	if (menu_level == 0)
	{
		for (var i = 0; i < 3; i++)
		{
			var _c = c_white;
			if (pos == i)
			{
				_c = c_yellow;
			}
			var which = i;
			load_time(which);
			//draw_text_color(title_menu_x + op_border - title_menu_w/2 + 180, title_menu_y + op_border + op_space*i - title_menu_h/2 - 40, myTime(global.myplaytime[i]), _c, _c, _c, _c, 0);
		}
	
	}
	
}
