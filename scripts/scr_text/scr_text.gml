function scr_set_default_for_text() {
	
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variable for every letter
	for (var c = 0; c < 500; c++)
	{
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
	
	
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	speaker_name[page_number] = noone;
	
}

//---------------text vfx------------------//
/// @param 1st character to color
/// @param last character to color
/// @param col1 top left of char
/// @param col2 top right of char
/// @param col3 bottom right of char
/// @param col4 bottom left of char
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) {
	
	for (var c = _start; c <= _end; c++)
	{
		col_1[c, page_number-1] = _col1;
		col_2[c, page_number-1] = _col2;
		col_3[c, page_number-1] = _col3;
		col_4[c, page_number-1] = _col4;
	
	}
	
	
}

/// @param 1st char
/// @param last char
function scr_text_wave(_start, _end) {

	for (var c = _start; c <= _end; c++)
	{
		float_text[c, page_number-1] = true;
	}
	
}


/// @param 1st char
/// @param last char
function scr_text_shake(_start, _end) {

	for (var c = _start; c <= _end; c++)
	{
		shake_text[c, page_number-1] = true;
	}
	
}


/// @param txt
/// @param [spriteinfo]
/// @param [side]
function scr_text(_text){

scr_set_default_for_text();

text[page_number] = _text;

//get character info
if (argument_count > 1)
{
	switch(argument[1])
	{
		case "lonna":
			speaker_sprite[page_number] = spr_portrait_lonna;
			speaker_name[page_number] = "LONNA DUPIN";
		break;
		
		case "victoria":
		
			speaker_sprite[page_number] = portraitvictoria_spr;
		
		break;
	
	}
}

if (argument_count > 2)
{
	speaker_side[page_number] = argument[2];

}


page_number++;


}

function scr_option(_option, _link_id) {
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
	
}



function create_textbox(whichdialogue) {
	
	with (instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_textbox))
	{
		scr_playerstatetalk(whichdialogue);
	}
}

