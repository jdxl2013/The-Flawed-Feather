
function scr_set_defaults_for_text() {
	line_break_pos[0, page_number] = 9999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	
	// Variables for colors :D
	//				2000 max chars, best large but low enough
	// COLORS WONT RUN WITHOUT THE INDENT STUFF AAAAAAAAAAAAAAAAAAAAAAAAAAAA
	//for (var i = 0; i < 3000; i++) {
		//col_1[i, page_number] = c_white;
		//col_2[i, page_number] = c_white;
		//col_3[i, page_number] = c_white;
		//col_4[i, page_number] = c_white;
		
		#region Thought i would need more colors for this lol
		/*
		col_2[i, page_number] = c_red;
		col_3[i, page_number] = c_outp_orange; // Outpatient Orange
		col_4[i, page_number] = c_yellow;
		col_5[i, page_number] = c_green;
		col_6[i, page_number] = c_blue;
		col_7[i, page_number] = c_purple;
		col_8[i, page_number] = c_grey;
		*/
		#endregion
	//}
	
	// Tutorial Video NPC Icons //
	
	//textbox_sprite[0] = spr_textbox;
	
	//textbox_type[page_number] = 0;
		//	0	-	Textbox GUI
		//	1	-	Textbubble
		//	2	-	Document (maybe in the same code)
		// might actually not need the type and just if it is following or not,
		// but then i wouldn't be able to make it into an actual document in the same code...
		// nvm im gonna just keep going with this method i can have cases where it cant find
		// someone to follow so it could just default to the top of the screen or something.
	//speaker_name[page_number] = "";
	//bubble_follow[page_number] = noone;
	
	
	
	//snd[page_number] = sfx_default_text;
		//Currently has nothing, add it later, had to delete it bacause the game wouldnt run
	
}

/// @param _start //1st_char
/// @param _end //last_char
/// @param _col1
/// @param _col2
/// @param _col3
/// @param _col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) {
	// note also that these are only established based on the pages and not options i think
	for (var i = _start; i <= _end; i++) {
		col_1[i, page_number] = _col1;
		col_2[i, page_number] = _col2;
		col_3[i, page_number] = _col3;
		col_4[i, page_number] = _col4;
		// set page_number to [page_number - 1] after you do that tutorial on the character icons (part 4)
	}
}

/// @param {String} [_name] <Name/Title of a textbox.>
/// @param {Real} [_textbox_type] <0 for textbox, 1 for textbubble, 2 for document, 3 for cinematic.>
/// @param {Asset.GMObject,Id.Instance} [_follow] <Object to follow. Textbubble exclusive.>
/// @param {Real} [_force_position] <0 for auto, 1 for standard, 2 for alternate.>
function scr_text_values(_name = "", _textbox_type = 0, _follow = noone, _force_position = 0) {
	speaker_name[page_number] = _name;
	textbox_type[page_number] = _textbox_type;
	bubble_follow[page_number] = _follow;
	forced_pos[page_number] = _force_position;
	
	value_change[page_number] = true;
}


/// @param {Asset.GMSprite} _sprite_sheet Character portrait sprite sheet.
/// @param {Real} _x_frame X frame of sheet. Starts at 0.
/// @param {Real} _y_frame Y frame of sheet. Starts at 0.
/// @param {Bool} [_on_leftside] Which side the portrait is drawn on. Set to false to be on the right side.
/// @param {Constant.color} [_bg_color] Color for the bg frame.
function scr_set_portrait(_sprite_sheet, _x_frame, _y_frame, _on_leftside = true, _bg_color = c_black) {

	character_portrait[page_number] = {
		sheet : _sprite_sheet,
		x_frame : _x_frame,
		y_frame : _y_frame,
		is_leftside : _on_leftside,
		bg_color : _bg_color,
	}
	
	portrait_change[page_number] = true;
	portrait_change_occured[page_number] = true;

}
/// @param	{Array<Struct.textbox_create_portrait_data>}	_portrait_data	Array for overlayering images. Check textbox_create_portrait_data().
/// @param	{Bool}											[_on_leftside]	Which side the portrait is drawn on. Set to false to be on the right side.
/// @param	{Constant.color}								[_bg_color]		Color for the bg frame.
function scr_set_portrait2(_portrait_data, _on_leftside = true, _bg_color = c_black) {	
	character_portrait[page_number] = {
		portrait_data : _portrait_data, //array_create(0, textbox_create_portrait_data(_sprite_sheet, _x_frame, _y_frame, _col = c_white, _alpha = 1),
		is_leftside : _on_leftside,
		bg_color : _bg_color,
	}
	
	portrait_change[page_number] = true;
	
	portrait_change_occured[page_number] = true;
	//if (page_number != 0) {
	//	if (character_portrait[page_number].is_leftside != character_portrait[page_number - 1].is_leftside) {
			
	//	}
	//}
}

function scr_clear_portrait() {
	
	portrait_change[page_number] = false;
	portrait_change_occured[page_number] = false;
}


/// @param _snd
/// @param {Real} [_pitch]
/// @param {Real} [_variance]
/// @param {Real} [_loudness]
function scr_set_typer_sound(_snd, _pitch = 1, _variance = 0, _loudness = 0.5) {
	
	typer_sound[page_number] = {
		snd : _snd,
		snd_pitch : _pitch,
		pitch_variance : _variance,
		loudness : _loudness
	}
	
	typer_sound_change[page_number] = true;
	
	typer_sound_change_occured[page_number] = true;
}

function scr_clear_typer_sound() {
	
	typer_sound_change[page_number] = false;
	typer_sound_change_occured[page_number] = false;
}

/// @param {Function} _function Function runs on creation or at the start of a new page.
function scr_text_function_start_page(_function) {
	start_page_function[page_number - 1] = _function;
}
/// @param {Function} _function Function runs on deletion or at the end of a page.
function scr_text_function_end_page(_function) {
	end_page_function[page_number - 1] = _function;
}

/// @param {Real} _string_index Integer value that results in it running. Value will clamp to the size of the string (1 & length).
/// @param {Function} _function Function that runs immediately after a specific character is drawn (runs with the char).
function scr_text_function_drawn_text(_string_index, _function) {
	var _text_length = string_length(text[page_number - 1]);
	_string_index = clamp(_string_index, 1, _text_length);
	
	array_push(drawn_text_function[page_number - 1], {
		funct : _function,
		index : _string_index,
		has_ran_funct : false,
	});
}


/// @param {String} _text <Text for a page.>
/// @param {String} [_name] <Name/Title of a textbox.>
/// @param {Real} [_textbox_type] <0 for textbox, 1 for textbubble, 2 for document, 3 for cinematic.>
/// @param {Id.Instance,Asset.GMObject} [_follow] <Object to follow. Textbubble exclusive.>
/// @param {Real} [_force_position] <0 for auto, 1 for standard, 2 for alternate.>
function scr_text(_text) {
	
	var _name =				argument_count >= 2 ?						argument[1] : "";
	var _textbox_type =		argument_count >= 3 ?						argument[2] : 0;
	var _follow =			argument_count >= 4 && argument[2] == 1 ?	argument[3] : noone;
	var _force_position =	argument_count >= 5 ?						argument[4] : 0;
	
	#region Value Information
	/*	
		TEXTBOX TYPE
		0	-	Textbox GUI
		1	-	Textbubble
		2	-	Document
		3	-	Cinematic
		
		FORCE POSITION
		0	-	None			|	Automated as of player position to the camera.
								|	If the player doesn't exist, it defaults to the standard position.
		1	-	Standard Pos	|	Box & Bubble = Above	-	Doc = Left
		2	-	Alternate Pos	|	Box & Bubble = Below	-	Doc = Right
		
		10/13/2024, 7:22PM, will be adding this later, need to decide on where in the function call
			it should be. Might put it at the end tbh... so its atleast,
			idk tbh because I need it to be forced when calling it in the documents tab.
			Idk Ill figure it out later tbh.
	*/
	#endregion
	
	
	//scr_set_defaults_for_text();
	//show_debug_message("Current Page Print: " + string(page_number));
	
	text[page_number] = _text;
	
	if (argument_count > 1) {
		scr_text_values(_name, _textbox_type, _follow, _force_position);
	} else if (page_number != 0) { // Inherit Prior Value
		if (!value_change[page_number]) {
			speaker_name[page_number] = speaker_name[page_number - 1];
			textbox_type[page_number] = textbox_type[page_number - 1];
			bubble_follow[page_number] = bubble_follow[page_number - 1];
			forced_pos[page_number] = forced_pos[page_number - 1];
		}
	}
	
	start_page_function[page_number] = 0;
	end_page_function[page_number] = 0;
	
	drawn_text_function[page_number] = array_create(0);
	
	if (!portrait_change_occured[page_number]) { // Checks if you've called the function to change the portrait.
		if (!portrait_change[page_number]) {
			character_portrait[page_number] = 0;
			//show_debug_message("NO character portrait.");
		} else if (page_number != 0) {
			if (portrait_change[page_number - 1]) {
				character_portrait[page_number] = {
					sheet : character_portrait[page_number - 1].sheet,
					x_frame : character_portrait[page_number - 1].x_frame,
					y_frame : character_portrait[page_number - 1].y_frame,
					
					//portrait_data : character_portrait[page_number - 1].portrait_data,
					
					is_leftside : character_portrait[page_number - 1].is_leftside,
					bg_color : character_portrait[page_number - 1].bg_color,
				}
			}
		}
	}
	
	if (!typer_sound_change_occured[page_number]) { // Checks if you've called the function to change the speaker audio.
		if (!typer_sound_change[page_number]) {
			typer_sound[page_number] = 0;
			//show_debug_message("NO character portrait.");
		} else if (page_number != 0) {
			if (typer_sound_change[page_number - 1]) {
				typer_sound[page_number] = {
					snd : typer_sound[page_number - 1].snd,
					snd_pitch : typer_sound[page_number - 1].snd_pitch,
					pitch_variance : typer_sound[page_number - 1].pitch_variance,
					loudness : typer_sound[page_number - 1].loudness,
				}
			}
		}
	}
			
	
	//show_debug_message("Page " + string(page_number) + " | Is Struct? " + string(is_struct(character_portrait[page_number])));
	//show_debug_message("Page " + string(page_number) + " | Is Struct? " + string(character_portrait[page_number].sheet == 0));
	
	/*
	if (global.debug.is_enabled) {
		show_debug_message("\nPage: " + string(page_number));
		show_debug_message("Name: " + string(speaker_name[page_number]));
		show_debug_message("Text: " + string(text[page_number]));
		show_debug_message("Box:  " + string(textbox_type[page_number]));
		show_debug_message("Foll: " + string(bubble_follow[page_number]));
		show_debug_message("Forc: " + string(forced_pos[page_number]));
		show_debug_message("ValC: " + string(value_change[page_number]));
	} */
	
	page_number++;
	
	value_change[page_number] = false;
	portrait_change[page_number] = false;
	portrait_change_occured[page_number] = false; // Goodness this code will need heavy optimization.
	// Ensures that it knows if you plan on changing the value or not. Keep this after the page number.
	typer_sound_change[page_number] = false;
	typer_sound_change_occured[page_number] = false;
	
	if (page_number != 0) {
		if (portrait_change[page_number - 1]) {
			portrait_change[page_number] = true;
		}
		if (typer_sound_change[page_number - 1]) {
			typer_sound_change[page_number] = true;
		}
	}
}

/// @param _option
/// @param _link_id
function scr_option(_option, _link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
	
	
}

/// @param	_text_id
function create_textbox(_text_id) {
	with (instance_create_depth(0, 0, -9999, obj_textbox)) {
		text_id = _text_id;
		page_number = 0;
		
		scr_game_text(_text_id);
	}
}

/// @param	{Id.Instance,Asset.GMObject} _follow	
function setup_interaction_follow(_follow) {
	
	if (_follow != noone && instance_exists(_follow)) {
		if (!instance_exists(obj_interaction_follow)) {
			instance_create_depth(follow.x, follow.y, 0, obj_interaction_follow);
		}
		with (obj_interaction_follow) {
			/*	Creation values, acts as the means of moving on "creation."
				Doing these values here since the step event of the object
				itself takes a frame to actually update.
			*/
			follow = _follow;
			x = follow.x;
			y = follow.y;
			mask_index = follow.sprite_index;
		}
	}
}
