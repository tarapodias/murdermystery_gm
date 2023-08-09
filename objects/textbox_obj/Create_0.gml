//textbox parameters
textbox_sprite = textbox_spr;
textbox_width = sprite_get_width(textbox_sprite);
textbox_height = sprite_get_height(textbox_sprite);
border = 8;
line_sep = 22;
line_width = textbox_width - border*2;
camera_offset = 500;

//text parameters
page = 0; //number of pages
page_number = 0; //current page number
text[0] = ""; 
text_length[0] = string_length(text[0]); //array of characters from text array
draw_char = 0; //number of characters in this page of text
text_speed = 0.5; //how fast to draw characters
char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;

//options
option[0] = "";  //initialize options array
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;
option_sprite = option_spr;
whichchoice = -1;


setup = false; //make sure setup is complete

//effects
scr_set_default_for_text();
last_free_space = 0;

text_pause_timer = 0;
text_pause_amount = 16;


