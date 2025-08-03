// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function handle_textbox_page_next() {
	// textboxes not documents.
	if (
		(value_change[page + 1] == true && 
			(
				//speaker_name[page] != speaker_name[page + 1] ||
				textbox_type[page] != textbox_type[page + 1] ||
				bubble_follow[page] != bubble_follow[page + 1] ||
				forced_pos[page] != forced_pos[page + 1]
			)
		) || (
			(is_struct(character_portrait[page]) && !is_struct(character_portrait[page + 1])) ||
			(!is_struct(character_portrait[page]) && is_struct(character_portrait[page + 1])) ||
			(
				(is_struct(character_portrait[page]) && is_struct(character_portrait[page + 1])) &&
				(
					character_portrait[page].is_leftside != character_portrait[page + 1].is_leftside ||
					character_portrait[page].bg_color != character_portrait[page + 1].bg_color
				)
			)
		)
	) {
		if (!change_anim) {
			change_anim = true;
		}
	} else {
		//page++;
		perform_textbox_page_next();
		
		if (textbox_type[page] != 3) {
			anim_x_offset = 2;
			next_anim = true;
		}
	}
}

function perform_textbox_page_next() {
	perform_textbox_end_function();
	page++;
	perform_textbox_start_function();
	
	if (currently_doing_skip) {
		perform_textbox_finish_drawn_text(text_length[page], false, false);
	} else {
		draw_char = 0;
	}
}

function perform_textbox_start_function() {
	//show_debug_message("Performed Textbox Start? Page: " + string(page) + " | Did it? " + string(is_method(start_page_function[page])));
	if (is_method(start_page_function[page])) start_page_function[page]();
}
function perform_textbox_end_function() {
	//show_debug_message("Performed Textbox End? Page: " + string(page) + " | Did it? " + string(is_method(end_page_function[page])));
	if (is_method(end_page_function[page])) end_page_function[page]();
}

/// @desc performed per each character of the string.
function perform_textbox_drawn_text_function(_string_index) {
	if (array_length(drawn_text_function[page]) == 0) exit;
	
	_string_index = floor(_string_index);
	
	for (var i = 0; i < array_length(drawn_text_function[page]); i++) {
		if (drawn_text_function[page, i].index == _string_index) {
			if (is_method(drawn_text_function[page, i].funct)) drawn_text_function[page, i].funct();
			if (drawn_text_function[page, i].has_ran_funct == false) drawn_text_function[page, i].has_ran_funct = true;
			exit;
		}
	}
}

/// @desc Performed at the end of a textbox drawn text in case of if you skip it.
/// @param {Real} [_perform_til_character] Runs all functions up til a certain character index, upper bound. Exclude if you want all to be ran.
function perform_textbox_remaining_drawn_text_functions_of_page(_perform_til_character = string_length(text[page])) {
	if (array_length(drawn_text_function[page]) == 0) exit;
	
	//var _perform_til_character = string_length(text[page]);
	//if (argument_count == 1) _perform_til_character = argument0
	
	// In order of characters, then the array itself.
	for (var i = 0; i <= _perform_til_character; i++) {
		for (var j = 0; j < array_length(drawn_text_function[page]); j++) {
			
			if (drawn_text_function[page, j].index == i) {
				if (drawn_text_function[page, j].has_ran_funct == false) {
					if (is_method(drawn_text_function[page, j].funct)) {
						drawn_text_function[page, j].funct();
					}
					drawn_text_function[page, j].has_ran_funct = true;
					break;
				}
			}
		}
	}
}

/// @desc Used whenever you want to go to the end of the drawn out text. Used in stuff like text skips also.
/// @param {Real} [_go_til_char] Sets drawn text to this index, also running prior functions here. Exclude to go to the end.
/// @param {Bool} [_is_less_than_check] If the if statement should check for if it's < or != in order to do the action. False by default.
/// @param {Bool} [_do_drawn_functions] Should it run the drawn text functions or not. True by default.
function perform_textbox_finish_drawn_text(_go_til_char = string_length(text[page]), _is_less_than_check = false, _do_drawn_functions = true) {
	// Only performs when the typing isn't done yet.
	if (
		(_is_less_than_check && draw_char < _go_til_char) ||
		(!_is_less_than_check && draw_char != _go_til_char)
	) {
		draw_char = _go_til_char; // text_length[page]
		if (_do_drawn_functions) {
			perform_textbox_remaining_drawn_text_functions_of_page(_go_til_char);
		}
	}
}