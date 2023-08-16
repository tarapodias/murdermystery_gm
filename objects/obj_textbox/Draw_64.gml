accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
scroll_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
scroll_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
back_key = keyboard_check_pressed(vk_rshift) || keyboard_check_pressed(ord("X"));

camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);
camera_width = camera_get_view_width(view_camera[0]);
camera_height = camera_get_view_height(view_camera[0]);
camera_border_x = camera_get_view_border_x(view_camera[0]);
camera_border_y = camera_get_view_border_y(view_camera[0]);
textbox_x = camera_width/2 - camera_border_x/4;
textbox_y = camera_height/2 - camera_border_y + camera_offset;
text_x_offset[0] = 0;


if (!setup)
{
	setup = true;
	draw_set_font(testfont_fnt);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	//page_number = array_length(text); //current page of the text
	for (var p = 0; p < page_number; p++)
	{
		//find # of char on each page and store in the text_length array
		text_length[p] = string_length(text[p]);
		
		//get x pos of textbox
				
			//if character portrait on left
			text_x_offset[p] = 120;
			portrait_x_offset[p] = -120;
			
			//if character portrait on right
			if (speaker_side[p] == -1)
			{
				text_x_offset[p] = -120;
				portrait_x_offset[p] = 890;
			}
		
			//if no characer sprite
			if (speaker_sprite[p] == noone)
			{
				text_x_offset[p] = 0;   
				
			}
				
		//setting individual char and finding the line breaks
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1;
			
			//store indiv char in array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			//get current width of the line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			
			//get the last free space
			if (char[c, p] == " ")
			{
				last_free_space = _char_pos+1;
			
			}
		
			//get line breaks
			if (_current_txt_w - line_break_offset[p] > line_width)
			{
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			
			}

		
		}
		
		//getting each char coordinates
		for (var c = 0; c < text_length[p]; c++)
		{
			var _char_pos = c+1;
			var _txt_x = textbox_x + border + text_x_offset[p];
			var _txt_y = textbox_y + border;
		
			//get current width of the line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			//compensate for line breaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
			{
				//if the current looping char is after a line break
				if (_char_pos >= line_break_pos[lb, p])
				{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
					
					//record the line this character should be on
					_txt_line = lb+1;
				}
			
			}
			
			//add to the x and y coordinates based on the new info
			char_x[c, p] = _txt_x + _current_txt_w;
			char_y[c, p] = _txt_y + _txt_line*line_sep;
		
		}
			
	}
}


//proceed to next page or speed up text when the player hits accept
if (accept_key)
{
	//if typing is done
	if (draw_char == text_length[page])
	{
		//go to next page
		if (page < page_number - 1)
		{
			page++;
			draw_char = 0;
		
		}
		//if we're at the end destroy the textbox
		else 
		{
			
			
			if (option_number > 0)
			{
				
			
				instance_destroy(obj_textbox);
			}
			
			else
			{
				obj_player.waittime = true;
				obj_player.alarm[0] = 60*0.75;
				instance_destroy(obj_textbox);
			}
			
			
		}
	}
	
}
//if typing is not done speed up text
if (back_key)
{
	if (!(draw_char == text_length[page]))
	{
		draw_char = text_length[page];
	}
}


//----------typing the text--------------------------------------//
if (text_pause_timer <= 0)
{
	if (draw_char < text_length[page])
	{
		draw_char += text_speed;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if (_check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == ",")
		{
			text_pause_timer = text_pause_amount;
		}
	}
}
else
{
	text_pause_timer--;
}

//draw textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

draw_sprite(textbox_sprite, 0,_txtb_x, _txtb_y);

//draw portrait sprite
if !(speaker_sprite[page] == noone)
{
	sprite_index = speaker_sprite[page];
	
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if (speaker_side[page] == -1)
	{
		_speaker_x += sprite_width;
	}
	
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);

	
	
} 


//draw text
for (var c = 0; c < draw_char; c++)
{
	//---------------special fx-----------------//
	//wavy text effect
	var _float_y = 0;
	if (float_text[c, page] == true)
	{
		float_dir[c, page] += -6;
		_float_y = dsin(float_dir[c, page])*1;
	
	}
	//shake text
	var _shake_x = 0;
	var _shake_y = 0;
	if (shake_text[c, page] == true)
	{
		shake_timer[c, page]--;
		if (shake_timer[c, page] <= 0)
		{
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] = irandom(360);

		}
		if (shake_timer[c, page] <= 2)
		{
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}
	
	
	//the text
	draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1);
}

//----------------------options---------------------------//
if (draw_char == text_length[page] && page == page_number - 1)
{
	//option selection
	option_pos += scroll_down - scroll_up;
	option_pos = clamp(option_pos, 0, option_number - 1);
	

		
	//draw the options
	var _option_space = 60;
	var _option_border = 60;
	for (var op = 0; op < option_number; op++)
	{
		//option box
		var _option_width = string_width(option[op]); //for checking the width of the text
		draw_sprite(option_sprite, 0, _txtb_x + _option_border, _txtb_y - _option_space*option_number + _option_space*op);
		
		//the arrow
		if (option_pos == op)
		{
			draw_sprite(arrow_spr, 0, _txtb_x + 15, _txtb_y - _option_space*option_number + _option_space*op + 5);
			obj_player.storechoice = option_link_id[option_pos]; 
			
		}
		
		//option text
		
		draw_text(_txtb_x + _option_border + 30, _txtb_y - _option_space*option_number + _option_space*op + 10, option[op]);
	
	}
}

