// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerstatetalk(whichdialogue){

	
	
	switch(whichdialogue)
	{
		case -1:
			show_debug_message("this is not interactable");
		break;
		
		case "window":
		
			scr_text("i need to come up with some nonsense that will make typing this text box even longer than it deos not. hello world and all who inhabit it. my name is spongebob. my pants are on the restructure nonsensicle popsicle gross ew i dont like it, try your best to do better.");
			scr_text("please let this work");
				scr_option("i want this to be longer for testing purposes", "window_a");
				scr_option("how can i format this so it looks really good?", "window_b");
			
		break;
		
			case "window_a":
				
				scr_text("im fighting with you right now");
				
			break;
			
			case "window_b":
			
				scr_text("goober and milky way are my fave");
			
			break;
			
		case "desk":
		
			scr_text("imdoing hard work at my desk look at me!");
			scr_text("omg im gonna cry please hand me a tissue");
				scr_option("yes i agree", "desk_a");
				scr_option("no i do not", "desk_b");
			
		break;
		
			case "desk_a":
				
				scr_text("testinggggggggggg");
				
			break;
			
			case "desk_b":
			
				scr_text("i have nothing interesting to say about this");
			
			break;
			
		case "test":	
		
			scr_text("in the sleeping bag there are empty wrappers for sour power straws and fritolay chips", "lonna");
				scr_text_wave(7, 15); scr_text_shake(49, 53);
			scr_text("lets add another page just to make sure it really really works");
			scr_text("i wanna really really really wanna zigazig ah.", "lonna");
			test_obj.updatetext = true;
			
		break;
		
			case "test_updated":	
		
				scr_text("I've seen all this shit already.");
				scr_text("It's soozetown!");
			
			break;
		
		case "chest":	
		
			scr_text("im a dragon", "lonna", -1);
				scr_text_color(5, 11, c_green, c_olive, c_lime, c_aqua);
			scr_text("rawr");
			scr_text("i say im dirty dan", "lonna");
			scr_text("no! im dirty dan!", "lonna", -1);
			scr_text("i love socks!! how do i tell her? what can I say to make things right, huh? tell me! come one, please. please just help me.", "lonna", -1);
		
			
		break;
			
			
	}
}