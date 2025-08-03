get_controls();





#region Setup
if (setup == false) {
	// Runs once
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	#region Initialization Per Page
	for (var i = 0; i < page_number; i++) {
		
		#region Pre-Page Init
		text_length[i] = string_length(text[i]);
		follow[i] = bubble_follow[i];
		final_textbox_width[i] = 30;
		final_textbox_height[i] = 30;
		textbox_x_offset[i] = 0;
		textbox_y_offset[i] = 0;
		#endregion
		
		#region TEXTBOX SIZE
	
		switch (textbox_type[i]) {
			#region Textbox
			case 0:
				final_textbox_width[i] = textbox_width;
				final_textbox_height[i] = textbox_height;
				break;
			#endregion
			#region Textbubble
			case 1:
				final_textbox_width[i] = textbubble_width;
				final_textbox_height[i] = textbubble_height;
				break;
			#endregion
			#region Document
			case 2:
				final_textbox_width[i] = document_width;
				final_textbox_height[i] = document_height;
				break;
			#endregion
			#region Cinematic
			case 3:
				final_textbox_width[i] = cinematic_width;
				final_textbox_height[i] = cinematic_height;
				break;
			#endregion
		}
	
		var _center_textbox_y = ((CAMERA_HEIGHT + final_textbox_height[i]) / 2) - final_textbox_height[i];
	
		#endregion
		
		#region Post-Page Init
		line_width[i] = final_textbox_width[i] - (text_border * 2) + 1;
		#endregion
		
		
		#region Text Variables
		/*
		// (also prevents that point where lines would need to continue to type out to then realize it needs to return)
		for (var j = 0; j < text_length[i]; j++) {
			var _char_pos = j + 1;
			
			char[j, i] = string_char_at(text[i], _char_pos);
			
			var _text_up_to_char = string_copy(text[i], 1, _char_pos);
			_text_up_to_char = string_replace_all(_text_up_to_char, "\n", "");			
			var _current_text_width = string_width(_text_up_to_char) - string_width(char[j, i]);
			
			// last free space
			if (char[j, i] == " ") last_free_space = _char_pos + 1;
			
			// get line breaks
			// || (char[j, i] == "\n")
			if ((_current_text_width - line_break_offset[i]) > line_width[i]) && (_char_pos != 1) {
				line_break_pos[line_break_num[i], i] = last_free_space;
				line_break_num[i]++;
				
				var _text_up_to_last_space = string_copy(text[i], 1, last_free_space - 1); // - 1
				_text_up_to_last_space = string_replace_all(_text_up_to_char, "\n", "");
				
				var _last_free_space_string = string_char_at(text[i], last_free_space);
				if !(char[j, i] == "\n")
					line_break_offset[i] = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		// Char coords
		for (var j = 0; j < text_length[i]; j++) {
			var _char_pos = j + 1;
			
			var _text_x = text_border; //textbox_x + textbox_x_offset[i] 
			var _text_y = text_border;
			
			var _text_up_to_char = string_copy(text[i], 1, _char_pos);
			_text_up_to_char = string_replace_all(_text_up_to_char, "\n", "");
			var _current_text_width = string_width(_text_up_to_char) - string_width(char[j, i]);
			
			var _text_line = 0;
			
			//line break loop
			for (var k = 0; k < line_break_num[i]; k++) {
				if (_char_pos >= line_break_pos[k, i]) {
					var _str_copy = string_copy(text[i], line_break_pos[k, i], _char_pos - line_break_pos[k, i]);
					_current_text_width = string_width(_str_copy);
					
					_text_line = k + 1;
				}
			}
			
			//add to the x & y coords
			char_x[j, i] = _text_x + _current_text_width;
			char_y[j, i] = _text_y + (_text_line * line_sep);
		}
		*/
		#endregion
		
	}
	#endregion
	
	perform_textbox_start_function();
}
#endregion

#region Box Position & Auto Alignment

#region Info
// I cant have it in the set up since it only does it once to apply it.

// Do later
// want to honestly make the position actively checked for in the case of changing or moving cameras,
// also helps incase i want to do so for text boxes other than textbubbles.
// documents would be different, either i lock it to one side or its dependent on the player position

/*			|	Box			|	Bubble		|	Document	|	Cinematic
true(MAIN)	|	Above		|	Above		|	Right		|	Above
false		|	Below		|	Below		|	Left		|	Below
*/
	
/*
0	-	None			|	Automated as of player position to the camera.
						|	If the player doesn't exist, it defaults to the standard position.
1	-	Standard Pos	|	Box & Bubble = Above	-	Doc = Left
2	-	Alternate Pos	|	Box & Bubble = Below	-	Doc = Right
*/
#endregion

#region Check For Auto Alignment
// Needed for the documents menu.
var _forced_value = forced_pos[page];
if (instance_exists(obj_documents_menu) && textbox_type[page] == 2) {
	_forced_value = 2;
}
	
switch (_forced_value) {
	#region Auto
	case 0: // Automated
		var _val_for_cam_x = (camera_get_view_x(view_camera[0]) + (CAMERA_WIDTH * 0.5));
		var _val_for_cam_y = (camera_get_view_y(view_camera[0]) + (CAMERA_HEIGHT * 0.5));
			
		var _val_for_cam_x_offset = 0;
		var _val_for_cam_y_offset = 0;//-16;
			
		#region Handle Autoposition
		if (instance_exists(obj_player)) {
			_val_for_cam_x_offset = -8 * obj_player.image_xscale;
				
			if (textbox_type[page] == 2) { // If Document
				if (obj_player.x + _val_for_cam_x_offset <= _val_for_cam_x) {
					textbox_alternate_pos = true;
				} else {
					// Default Positions
					textbox_alternate_pos = false;
				}
			} else {
				if (obj_player.y + _val_for_cam_y_offset <= _val_for_cam_y) {
					textbox_alternate_pos = true;
				} else {
					// Default Positions
					textbox_alternate_pos = false;
				}
			}
		} else {
			textbox_alternate_pos = true;
		}
		#endregion
			
		#region DEBUG
		if (global.debug.is_enabled) {
			if (textbox_type[page] == 2) {
				draw_line(_val_for_cam_x, 0, _val_for_cam_x, 5000);
				draw_line_color(
						obj_player.x + _val_for_cam_x_offset, 0,
						obj_player.x + _val_for_cam_x_offset, 5000,
						c_lime, c_lime);
			} else {
				draw_line(0, _val_for_cam_y, 5000, _val_for_cam_y);
				draw_line_color(
						0, obj_player.y + _val_for_cam_y_offset,
						5000, obj_player.y + _val_for_cam_y_offset,
						c_lime, c_lime);
			}
		}
		#endregion
			
		break;
	#endregion
	#region Forced Normal
	case 1: 
		textbox_alternate_pos = false;
		break;
	#endregion
	#region Forced Alternate
	case 2:
		textbox_alternate_pos = true;
		break;
	#endregion
		
}
#endregion

#region Auto Alignment Values For Each Textbox Type

current_box_type = textbox_type[page];
// For Loop assigns variables for every page.
for (var i = 0; i < page_number; i++) {
	
	//show_debug_message("Textbox type = " + string(textbox_type[i]))
	
	switch (textbox_type[i]) {
		#region Textbox
		case 0:
			// Default Textbox
			var _center_textbox_x = ((CAMERA_WIDTH + final_textbox_width[i]) / 2) - final_textbox_width[i];
			textbox_x_offset[i] = _center_textbox_x;
			//textbox_y_offset[i] = 8;
			if (textbox_alternate_pos == true) {
				// BOTTOM
				textbox_y_offset[i] = (CAMERA_HEIGHT - final_textbox_height[i] - 8);
			} else {
				// TOP
				textbox_y_offset[i] = 8;
			}
			break;
		#endregion
		#region Textbubble
		case 1:
			if (follow[i] != noone && instance_exists(follow[i])) { // If Following Something
			
				//setup_interaction_follow(follow[i]);
			
				textbox_x_offset[i] = -((final_textbox_width[i] / 2) - 0.5);
			
				// follow[page].sprite_height;		(follow[i].bbox_top - follow[i].bbox_bottom);
				// need to get it so this position updates automatically
				if (textbox_alternate_pos == true) {
					// BELOW PLAYER
					textbox_y_offset[i] = -((follow[i].bbox_top - follow[i].bbox_bottom) + 8);
				} else {
					// ABOVE PLAYER
					textbox_y_offset[i] = -(final_textbox_height[i] - (follow[i].bbox_top - follow[i].bbox_bottom) + 8);
				}
			} else {
				// in the case that it has no one to follow, it abides just like the normal textbox,
				// still the same size though.
				var _center_textbox_x = ((CAMERA_WIDTH + final_textbox_width[i]) / 2) - final_textbox_width[i];
				textbox_x_offset[i] = _center_textbox_x;
				if (textbox_alternate_pos == true) {
					// BOTTOM
					textbox_y_offset[i] = (CAMERA_HEIGHT - final_textbox_height[i] - 8);
				} else {
					// TOP
					textbox_y_offset[i] = 8;
				}
			}
			break;
		#endregion
		#region Document
		case 2:
			//textbox_x_offset[i] = 8; // increase later so its on the right or left side of the screen
		
			if (textbox_alternate_pos == true) {
				// RIGHT
				textbox_x_offset[i] = (CAMERA_WIDTH - final_textbox_width[i] - 8);
			} else {
				// LEFT
				textbox_x_offset[i] = 8;
			}
			textbox_y_offset[i] = 8;
			break;
		#endregion
		#region Cinematic
		case 3:
			// Default Textbox
			textbox_x_offset[i] = 0;
		
			if (textbox_alternate_pos == true) {
				// BOTTOM
				textbox_y_offset[i] = CAMERA_HEIGHT - final_textbox_height[i];
				//show_debug_message("below");
			} else {
				// TOP
				textbox_y_offset[i] = 0;
				//show_debug_message("above");
			}
			break;
		#endregion
	}

}
//var _center_textbox_x = ((CAMERA_WIDTH + final_textbox_width[i]) / 2) - final_textbox_width[i];
//var _center_textbox_y = ((CAMERA_HEIGHT + final_textbox_height[i]) / 2) - final_textbox_height[i];

#endregion

#region Figure Out Follow - Either Camera or Object

// Set to an object
if (textbox_type[page] == 1) && (follow[page] != noone && instance_exists(follow[page])) {
	
	var _clamp_alt_y_offset = textbox_alternate_pos == true ? -(final_textbox_height[page] + 8) : 0;
	textbox_x = calc_clamp_lengths(
		follow[page].x,
		camera_get_view_x(view_camera[0]),
		CAMERA_WIDTH, final_textbox_width[page],
		8, abs(textbox_x_offset[page]));
	textbox_y = calc_clamp_lengths(
		follow[page].y,
		camera_get_view_y(view_camera[0]),
		CAMERA_HEIGHT, final_textbox_height[page],
		8, abs(textbox_y_offset[page]) + _clamp_alt_y_offset);
	
} else {
	// Set to the camera
	textbox_x = camera_get_view_x(view_camera[0]);
	textbox_y = camera_get_view_y(view_camera[0]);
}
#endregion

#endregion

#region Text Typing
if (textbox_type[page] != 2) {
	if (text_pause_timer <= 0) {
		if (draw_char < text_length[page]) {
			
			draw_char += text_speed;
			draw_char = clamp(draw_char, 0, text_length[page]);
			
			perform_textbox_drawn_text_function(draw_char);
			
			
			var _check_char = string_char_at(text[page], draw_char);
			
			#region Pause On Certain Character
			//(when you get to textbubbles), make sure those are the only ones effected by pauses)
			// ...maybe, it gives it flavor in general but still think on it.
			
			// When to pause.
			var _pause_char_array =	".,?!";
			
			if (string_pos(_check_char, _pause_char_array) != 0) {
				text_pause_timer = text_pause_time;
			}
			
			#endregion
			
			#region Make Sounds
			
			// When not to make noises.
			var _no_sound_char_array = ".,?!-()<>[]{}*:; ";
			
			if (string_pos(_check_char, _no_sound_char_array) == 0) {
				if (is_struct(typer_sound[page])) {
					textbox_typer_play_sounds(
						typer_sound[page].snd,
						typer_sound[page].snd_pitch,
						typer_sound[page].pitch_variance,
						typer_sound[page].loudness);
				} else {
					textbox_typer_play_sounds(
						snd_voice_default,
						0.9,
						0.1,
						0.5);
				}
			}
			#endregion
		}
	} else {
		text_pause_timer--;	
	}
} else {
	// If its a document, it should just print out all of the text
	// if using the code for textboxes, then it will skip the first page of the document.
	draw_char = text_length[page];
}
#endregion

#region ***** TEXTBOX CONTROLS *****

// Textboxes & Bubbles
accept_key = confirm_key_pressed;

/*skip_key = page == 0 ? cancel_key_pressed : cancel_key;
if (instance_exists(obj_player)) {
	if (obj_player.key_run) {
		skip_key = cancel_key_pressed;
	}
}*/
skip_key = cancel_key;

auto_skip_key = !can_hold_auto_skip_key ? menu_key_pressed : menu_key;
if (!can_hold_auto_skip_key) {
	if (auto_skip_key && page == 0) {
		can_hold_auto_skip_key = true;
	} else if (page != 0) {
		can_hold_auto_skip_key = true;
	}
}
// Prevents auto skip when you run into a cutscene or something.
// (One of my personal gripes with Deltarune's System) (might turn into a system option for player preference) 

currently_doing_skip = clamp(skip_key + auto_skip_key, 0, 1);

// Documents
next_page_key = right_key_pressed;
prev_page_key = left_key_pressed;
close_document_key = cancel_key_pressed;

#endregion

#region Change Page Controls 

if (!create_anim && !delete_anim && !change_anim) { // Makes sure that the textbox cannot be altered when created or deleted.
	
	#region Textbox Input
	
	if (textbox_type[page] != 2) {
		#region Auto Skip
		if (auto_skip_key) {
			// goes to the next page if held down
			if (
				draw_char != text_length[page] &&
				draw_char < text_length[page] - 1 &&
				text_length[page] > 1
			) {
				perform_textbox_finish_drawn_text(text_length[page] - 1, true, true);
			} else if (draw_char == text_length[page]) {
				if (page < page_number - 1) {
					handle_textbox_page_next();
				} else {
					if (option_number == 0) {
						// ENDS THE TEXTBOX
						delete_anim = true;
					}
				}
			}
		} 
		#endregion 
		#region Normal Skip
		else if (skip_key) {
			perform_textbox_finish_drawn_text(text_length[page], false, true);
		}
		#endregion
		
		#region Go To Next Page
		if (accept_key) {
			// If Typing Done
			if (draw_char == text_length[page]) {
				// Next Page of Text
				if (page < page_number - 1) {
					handle_textbox_page_next();
				} else {
					if (option_number > 0) {
						create_textbox(option_link_id[option_pos]);
					}
					// ENDS THE TEXTBOX
					delete_anim = true;
				}
			}
			// Typing not done
			//else if (draw_char != text_length[page] && draw_char > 1) {
			//	draw_char = text_length[page];
			//}
		}
		#endregion
	}
	#endregion
	
	#region Document Input
	else {
		if (next_page_key) {
			if page < page_number - 1 {
				page++;
				anim_x_offset = 2;
				next_anim = true;
			}
		}
		if (prev_page_key) {
			if page > 0 {
				page--;
				anim_x_offset = -2;
				prev_anim = true;
			}
		}
		if (close_document_key) {
			if (option_number > 0) {
				create_textbox(option_link_id[option_pos]);
			}
			delete_anim = true;
		
		}
	}
	#endregion
}
#endregion

#region Box Animations
if create_anim { // Creation Anim
	if (textbox_type[page] == 3) {
		box_alpha += (final_box_alpha / 5) / 3;
		text_alpha += (0.2) / 3;
	} else {
		box_alpha += final_box_alpha / 5;
		text_alpha += 0.2;
	}
	if (box_alpha >= final_box_alpha || (currently_doing_skip && textbox_type[page] != 2)) {
		create_anim = false;
		// Base Values
		box_alpha = final_box_alpha;
		text_alpha = 1;
		anim_x_offset = 0;
		anim_y_offset = 0;
	}
}
if next_anim { // Next Anim
	//anim_x_offset = 2;
	anim_x_offset -= 0.5;
	if (anim_x_offset <= 0) {
		next_anim = false;
		anim_x_offset = 0;
	}
}
if prev_anim { // Prev Anim
	//anim_x_offset = -2;
	anim_x_offset += 0.5;
	if (anim_x_offset >= 0) {
		prev_anim = false;
		anim_x_offset = 0;
		
	}
}
if delete_anim { // Deletion Anim
	if (textbox_type[page] == 3) {
		box_alpha -= (final_box_alpha / 5) / 3;
		text_alpha -= (0.2) / 3;
	} else {
		box_alpha -= final_box_alpha / 5;
		text_alpha -= 0.2;
	}
	
	switch (textbox_type[page]) {
		#region Textbox
		case 0:
			anim_x_offset -= 1;
			break;
		#endregion
		#region Textbubble
		case 1:
			if (textbox_alternate_pos == false) anim_y_offset += 1;
			else anim_y_offset -= 1;
			break;
		#endregion
		#region Document
		case 2:
			if (!instance_exists(obj_documents_menu)) {
				if (textbox_alternate_pos == false) anim_y_offset -= 1;
				else anim_x_offset += 1;
			}
			break;
		#endregion
		#region Cinematic
		case 3:
			if (textbox_alternate_pos == false) anim_y_offset -= 1;
			else anim_y_offset += 1;
			break;
		#endregion
	}
	
	if (box_alpha <= 0 || (currently_doing_skip && textbox_type[page] != 2)) {
		perform_textbox_end_function();
		instance_destroy();
	}
}
if change_anim { // Change Value Anim
	if (textbox_type[page] == 3) {
		box_alpha -= (final_box_alpha / 5) / 3;
		text_alpha -= (0.2) / 3;
	} else {
		box_alpha -= final_box_alpha / 5;
		text_alpha -= 0.2;
	}
	
	switch (textbox_type[page]) {
		#region Textbox
		case 0:
			anim_x_offset -= 1;
			break;
		#endregion
		#region Textbubble
		case 1:
			if (textbox_alternate_pos == false) anim_y_offset += 1;
			else anim_y_offset -= 1;
			break;
		#endregion
		#region Document
		case 2:
			if (!instance_exists(obj_documents_menu)) {
				if (textbox_alternate_pos == false) anim_y_offset -= 1;
				else anim_x_offset += 1;
			}
			break;
		#endregion
		#region Cinematic
		case 3:
			if (textbox_alternate_pos == false) anim_y_offset -= 1;
			else anim_y_offset += 1;
			break;
		#endregion
	}
	
	if (box_alpha <= 0 || currently_doing_skip) {
		change_anim = false;
		create_anim = true;
		//page++;
		perform_textbox_page_next();
		draw_char = 0;
		anim_x_offset = 0;
		anim_y_offset = 0;
	}
}
#endregion





#region Textbox Draw

//var _portrait_width = 0;
//if (is_struct(character_portrait[page])) _portrait_width = 43 + 1;
//var _portrait_offset = 0;
//if (is_struct(character_portrait[page])) _portrait_offset = character_portrait[page].is_leftside ? 22 : -22;

var _box_x = textbox_x + textbox_x_offset[page];
var _box_y = textbox_y + textbox_y_offset[page];
var _box_width = final_textbox_width[page];
var _box_height = final_textbox_height[page];

box_img += box_spd;
var _box_spr_width = sprite_get_width(box_spr);
var _box_spr_height = sprite_get_height(box_spr);

var _cinematic_box_y_scale = textbox_alternate_pos ? -1 : 1;
if (textbox_type[page] == 3) {
	//show_debug_message(string(_cinematic_box_y_scale) + " Y Scale : Alt Pos " + string(textbox_alternate_pos));
	draw_sprite_ext(
		spr_cinematic_box, 0,
		textbox_x + anim_x_offset + (CAMERA_WIDTH / 2),
		textbox_y + anim_y_offset + (CAMERA_HEIGHT / 2),
		1, _cinematic_box_y_scale,
		0, c_black, box_alpha * 0.75);
		
} else {
	draw_sprite_ext(
		box_spr, box_img,
		_box_x + anim_x_offset,
		_box_y + anim_y_offset,
		_box_width / _box_spr_width,
		_box_height / _box_spr_height,
		0, c_black, box_alpha);
}
#endregion

#region Draw Name
if (speaker_name[page] != "") {
	var _name_space = 10;
	var _name_board = 4;
	var _name_width = string_width(speaker_name[page]) + (_name_board * 2);
	//textbox_alternate_pos = false;
	
	
	switch (textbox_type[page]) {
		#region	Textbox
		case 0:
			var _box_x_pos = _box_x + (_box_width - _name_width) - 6;
			var _box_y_pos = (_box_y + _box_height) - 4;
			var _text_x_pos = _box_x + (_box_width - _name_width) + (_name_board - 5);
			var _text_y_pos = (_box_y + _box_height) - 3;
			if (textbox_alternate_pos == true) {
				_box_x_pos = _box_x + (_box_width - _name_width) - 5;
				_box_y_pos = _box_y - 4;
				_text_x_pos = _box_x + (_box_width - _name_width) + (_name_board - 4);
				_text_y_pos = _box_y - 3;
			}
			
			draw_sprite_ext(
				box_spr, box_img,
				_box_x_pos + anim_x_offset,
				_box_y_pos + anim_y_offset,
				(_name_width + 1) / _box_spr_width,
				(_name_space - 1) / _box_spr_height,
				0, c_black, box_alpha);
			draw_text_color(
				_text_x_pos + anim_x_offset,
				_text_y_pos + anim_y_offset,
				speaker_name[page],
				c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
			break;
		#endregion
		#region	Textbubble
		case 1:
			_box_x_pos = _box_x + ((_box_width + _name_width) / 2) - _name_width;
			_box_y_pos = (_box_y + _box_height) - 4;
			_text_x_pos = _box_x + (((_box_width + _name_width) / 2) - _name_width) + (_name_board + 1);
			_text_y_pos = (_box_y + _box_height) - 3;
			if (textbox_alternate_pos == true) {
				_box_x_pos = _box_x + ((_box_width + _name_width) / 2) - _name_width;
				_box_y_pos = _box_y - 4;
				_text_x_pos = _box_x + (((_box_width + _name_width) / 2) - _name_width) + (_name_board + 1);
				_text_y_pos = _box_y - 3;
			}
			
			draw_sprite_ext(
				box_spr, box_img,
				_box_x_pos + anim_x_offset,
				_box_y_pos + anim_y_offset,
				(_name_width + 1) / _box_spr_width,
				(_name_space - 1) / _box_spr_height,
				0, c_black, box_alpha);
			draw_text_color(
				_text_x_pos + anim_x_offset,
				_text_y_pos + anim_y_offset,
				speaker_name[page],
				c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
			break;
		#endregion
		#region	Document
		case 2:
			if ((_name_width + 1) < document_width) { // CENTER
				draw_sprite_ext(
					box_spr, box_img,
					_box_x + ((_box_width + _name_width) / 2) - _name_width + anim_x_offset,
					_box_y - 5 + anim_y_offset,
					(_name_width + 1) / _box_spr_width,
					(_name_space - 1) / _box_spr_height,
					0, c_black, box_alpha);
				draw_text_color(
					_box_x + (((_box_width + _name_width) / 2) - _name_width) + (_name_board + 1) + anim_x_offset,
					_box_y - 4 + anim_y_offset,
					speaker_name[page],
					c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
			} else { // SIDE
				_box_x_pos = _box_x + 5;
				_text_x_pos = _box_x + (_name_board + 6);
				if (textbox_alternate_pos == true) {
					// If true, its on the right side of the screen instead.
					_box_x_pos = _box_x - 5 - ((_name_width + 1) - document_width);
					_text_x_pos = _box_x + (_name_board - 4) - ((_name_width + 1) - document_width);
				}
				draw_sprite_ext(
					box_spr, box_img,
					_box_x_pos + anim_x_offset,
					_box_y - 5 + anim_y_offset,
					(_name_width + 1) / _box_spr_width,
					(_name_space - 1) / _box_spr_height,
					0, c_black, box_alpha);
				draw_text_color(
					_text_x_pos + anim_x_offset,
					_box_y - 4 + anim_y_offset,
					speaker_name[page],
					c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
			}
			break;
		#endregion
		#region	Cinematic
		case 3:
			_box_x_pos = _box_x + ((_box_width + _name_width) / 2) - _name_width;
			_box_y_pos = _box_y - 4 + 5;
			_text_x_pos = _box_x + (((_box_width + _name_width) / 2) - _name_width) + (_name_board + 1);
			_text_y_pos = _box_y - 3 + 5;
			if (textbox_alternate_pos == true) {
				_box_x_pos = _box_x + ((_box_width + _name_width) / 2) - _name_width;
				_box_y_pos = (_box_y + _box_height) - 4 - 6;
				_text_x_pos = _box_x + (((_box_width + _name_width) / 2) - _name_width) + (_name_board + 1);
				_text_y_pos = (_box_y + _box_height) - 3 - 6;
			}
			
			draw_sprite_ext(
				box_spr, box_img,
				round(_box_x_pos) + anim_x_offset,
				_box_y_pos + anim_y_offset,
				(_name_width + 1) / _box_spr_width,
				(_name_space - 1) / _box_spr_height,
				0, c_black, box_alpha);
			draw_text_color(
				round(_text_x_pos) + anim_x_offset,
				_text_y_pos + anim_y_offset,
				speaker_name[page],
				c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
			break;
		#endregion
	}
}
#endregion

#region Draw Character Portrait
if (is_struct(character_portrait[page])) {
//if (character_portrait[page].sheet != 0) {
	var _char_portrait_x_offset = character_portrait[page].is_leftside ? -44 : _box_width + 1;
	//var _char_portrait_y_offset = 
	
	draw_character_portrait(
		_box_x + anim_x_offset + _char_portrait_x_offset,
		_box_y + anim_y_offset,
		character_portrait[page].sheet,
		character_portrait[page].x_frame,
		character_portrait[page].y_frame,
		character_portrait[page].bg_color,
		box_alpha,
		text_alpha);
}
#endregion

#region Document Page Number
if (textbox_type[page] == 2) {
	// Document Title
	#region Page indicator (initialization vars)
	// im literally just copying what Signalis did lol
	var _page_str_current = "";
	if (page < 9) _page_str_current = "0" + string(page + 1);
	else _page_str_current = string(page + 1);

	var _page_str_max = "";
	if (page_number < 10) _page_str_max = "0" + string(page_number);
	else _page_str_max = string(page_number);
	
	var _page_str_next = "";
	if (page == page_number - 1) _page_str_next = " – ";
	else _page_str_next = " > ";
	
	var _page_str_prev = "";
	if (page == 0) _page_str_prev = " – ";
	else _page_str_prev = " < ";
	
	var _page_indicator = _page_str_prev + _page_str_current + " / " + _page_str_max + _page_str_next;
	
	var _page_str_space = 10;
	var _page_str_board = 4;
	var _page_str_width = string_width(_page_indicator) + (_page_str_board * 2);
	
	#endregion
	
	draw_sprite_ext(
		box_spr, box_img,
		_box_x + ((_box_width + _page_str_width) / 2) - _page_str_width + anim_x_offset,
		(_box_y + _box_height) - 4 + anim_y_offset,
		(_page_str_width + 1) / _box_spr_width,
		(_page_str_space - 1) / _box_spr_height,
		0, c_black, box_alpha);
	
	draw_text_color(
		_box_x + (((_box_width + _page_str_width) / 2) - _page_str_width) + (_page_str_board + 1) + anim_x_offset,
		(_box_y + _box_height) - 3 + anim_y_offset,
		_page_indicator,
		c_grey, c_grey, c_grey, c_grey, text_alpha); // kinda like the gray ngl
		//c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, 1);
		//c_outp_lticon, c_outp_lticon, c_outp_lticon, c_outp_lticon, text_alpha);
}
#endregion

#region Options
if (draw_char == text_length[page] && page == page_number - 1) {
	
	// option Select
	option_pos += down_key_pressed - up_key_pressed;
	if (option_number <= 2) {
		option_pos = clamp(option_pos, 0, option_number - 1);
	} else {
		if (option_pos < 0) option_pos = option_number - 1;
		if (option_pos > option_number - 1) option_pos = 0;
	}
	
	
	// Tutorial Method (sets options to the textbox set to the window)
	//var _op_space = 10;
	var _op_board = 4;
	
	var _total_height = 0;
	for (var i = 0; i < option_number; i++) {
		_total_height += string_height(option[i]) + 3;
	}
	
	for (var i = 0; i < option_number; i++) {
		
		//show_debug_message("Option_Number: " + string(_box_y + (_op_space * option_number) + (_op_space * i) + 2));
		
		
		// option boxes
		var _op_width = string_width(option[i]) + (_op_board * 2);
		var _op_space = string_height(option[i]) + 1 + 2;
		var _op_spacing = 0;
		
		// add up prior option sizes
		for (var j = 0; j < i; j++) {
			if (i != 0) _op_spacing += string_height(option[j]) + 3;
		}
		
		
		
		var _box_y_pos = (_box_y + _box_height) + (_op_spacing) + 1;
		var _text_y_pos = (_box_y + _box_height) + (_op_spacing) + 2;
		if (textbox_alternate_pos == true) {
			_box_y_pos = (_box_y - _total_height) + (_op_spacing);
			_text_y_pos = (_box_y - _total_height) + (_op_spacing) + 1;
		}
		
		
		#region Extra fixes due to the font rework.
		// My goodness this was such an annoying work around.
		_op_space--;
		
		if (textbox_alternate_pos == true) {
			_box_y_pos -= i;
			_text_y_pos -= i;
		} else {
			_box_y_pos -= i;
			_text_y_pos -= i;
		}
		if (textbox_alternate_pos == true) {
			_box_y_pos += option_number;
			_text_y_pos += option_number;
		}
		#endregion
		
		var _cinematic_op_x_offset = textbox_type[page] == 3 ? 4 : 0;
		
		draw_sprite_ext(
			box_spr, box_img,
			_box_x + _cinematic_op_x_offset, // ( + X) shift options, like indent them from the main box
			//(_box_y + (_op_space * option_number)) + (_op_space * i) + 2,
			_box_y_pos,
			(_op_width + 1) / _box_spr_width,
			(_op_space - 1) / _box_spr_height,
			0, c_black, box_alpha);
		
		// selected option & option text
		var _op_color = 0;
		if (option_pos == i) {
			_op_color = c_outp_orange;
			//show_debug_message("Option_Number: " + string(_box_y + (_op_space * option_pos) + (_op_space * i) + 2));
			//c_outp_orange, c_white, c_white, c_outp_orange, 1);
			//c_white, c_white, c_white, c_white, 1);
		} else {
			_op_color = c_white;
			//c_outp_lticon, c_outp_lticon, c_outp_lticon, c_outp_lticon, text_alpha);
			//c_grey, c_grey, c_grey, c_grey, text_alpha);
		}
		draw_text_color(
			_box_x + _op_board + 1 + _cinematic_op_x_offset,
			_text_y_pos,
			option[i],
			_op_color, _op_color, _op_color, _op_color, text_alpha);
	}
	
	// My Method (preferably would like the choices to appear over or beneath Costel)
	
}
#endregion

#region Draw Text
var _drawtext = string_copy(text[page], 1, draw_char);
var _drawtyper_char = "█";

if (draw_char < text_length[page] && textbox_type[page] != 2) {
	/*if (skip_key) {
		_drawtext = string_copy(text[page], 1, text_length[page]);
		for (var i = draw_char + 1; i <= text_length[page]; i++) {
			if (string_char_at(_drawtext, i) != " ") {
				_drawtext = string_replace_at(_drawtext, i, _drawtyper_char);
			}
		}
	} else {*/
		if (!currently_doing_skip) _drawtext += _drawtyper_char;
	//}
}


var _cinematic_text_y_offset = 0;
if (textbox_type[page] == 3) {
	_cinematic_text_y_offset = textbox_alternate_pos ? -4 : 4;
}

//draw_text_ext(_box_x + text_border, _box_y + text_border - 2, _drawtext, line_sep, line_width[page]);

draw_text_ext_color(
		_box_x + text_border + anim_x_offset,
		_box_y + text_border - 2 + anim_y_offset + _cinematic_text_y_offset,
		_drawtext, line_sep, line_width[page],
		c_white, c_white, c_white, c_white, text_alpha);
	

#region indent stuff
/*
for (var i = 0; i < draw_char; i++) {
	draw_text_ext_color(
		_box_x + text_border, _box_y + text_border - 2, _drawtext, line_sep, line_width[page],
		col_1[i, page], col_2[i, page], col_3[i, page], col_4[i, page], text_alpha);
}*/
/*
for (var i = 0; i < draw_char; i++) {
	
	
	draw_text(
		char_x[i, page] + textbox_x + textbox_x_offset[page] + anim_x_offset,
		char_y[i, page] + textbox_y + textbox_y_offset[page] + anim_y_offset,
		char[i, page]);
	//draw_text_ext(_box_x + textbox_x_offset[page] + text_border, _box_y + text_border - 2, _drawtext, line_sep, line_width[page]);
	draw_text_ext(
		char_x[i, page] + textbox_x + textbox_x_offset[page] + anim_x_offset,
		char_y[i, page] + textbox_y + textbox_y_offset[page] + anim_y_offset,
		string_copy(char[i, page], 1, draw_char),
		line_sep,
		line_width[page]);
}*/
#endregion

#endregion
