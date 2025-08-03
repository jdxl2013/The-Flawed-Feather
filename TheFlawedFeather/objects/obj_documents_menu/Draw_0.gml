
get_controls();

// Draws and can be interacted with only if it's allowed to.

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

//var _textbox_x_offset = ((CAMERA_WIDTH + textbox_width) / 2) - textbox_width;
//var _textbox_y_offset = ((CAMERA_HEIGHT + textbox_height) / 2) - textbox_height + 32;

var _textbox_x_offset = CAMERA_WIDTH - (textbox_width + 8);//64;
var _textbox_y_offset = 18;

box_img += box_spd;

#region Animations

// Seriously debate on turning this into a case statement.

if (help_me_anim == 1) { // Creation Anim
	box_alpha += 0.2;
	text_alpha += 0.2;
	anim_x_offset += 1;
	
	if (box_alpha >= 1) {
		help_me_anim = 0;
		
		// Base Values
		box_alpha = 1;
		text_alpha = 1;
		anim_x_offset = 0;
		anim_y_offset = 0;
	}
}
if (help_me_anim == 2) { // Deletion Anim
	box_alpha -= 0.2; // 0.05 for testing, 0.2 is normal
	text_alpha -= 0.2;
	anim_x_offset -= 1;
	
	if (text_alpha <= 0) {
		//if (help_me_anim != -1) 
		//	help_me_anim = -1;
		audio_play_sound(snd_menu_close, 3, false);
		instance_destroy();
	}
}
if (help_me_anim == 3) { // Become Trans Anim
	box_alpha -= 0.1;
	text_alpha -= 0.1;
	
	if (box_alpha <= 0.5) {
		help_me_anim = 0;
		box_alpha = 0.5;
		text_alpha = 0.5; // trans alpha
	}
}
if (help_me_anim == 4) { // Become Not Trans Anim
	box_alpha += 0.1;
	text_alpha += 0.1;
	
	if (box_alpha >= 1) {
		help_me_anim = 0;
		box_alpha = 1;
		text_alpha = 1; // trans alpha
	}
}

if next_anim { // Next Anim
	//anim_x_offset = 2;
	anim_y_offset -= 0.5;
	if (anim_y_offset <= 0) {
		next_anim = false;
		anim_y_offset = 0;
	}
}
if prev_anim { // Prev Anim
	//anim_x_offset = -2;
	anim_y_offset += 0.5;
	if (anim_y_offset >= 0) {
		prev_anim = false;
		anim_y_offset = 0;
		
	}
}

#endregion

#region Document Selection Bar
//var _xx = obj_camera.x - 128;
//var _yy = obj_camera.y + 64;
var _box_x = textbox_x + _textbox_x_offset;
var _box_y = textbox_y + _textbox_y_offset;
var _sep = 16;

// Does not get animated with each page movement
var action_box_anim_x = anim_x_offset;
var action_box_anim_y = anim_y_offset;
if (next_anim || prev_anim) {
	//action_box_anim_x = 0;
	//action_box_anim_y = 0;
}



#endregion




#region Selection Indicator
_box_x = textbox_x + 8;
_box_y = textbox_y + 8;

draw_sprite_ext(
	box_spr, box_img,
	_box_x,
	_box_y,
	indicator_width / box_spr_width,
	indicator_height / box_spr_height,
	0, c_black, box_alpha);

var _indicator_num = string(option_pos + 1);
var _indicator_total = string(array_length(global.inventory.docs));
var _indicator_color = 0;
var _final_indicator_text = 0;

if (_indicator_num < 10) _indicator_num = "0" + string(option_pos + 1);
if (_indicator_total < 10) _indicator_total = "0" + string(array_length(global.inventory.docs));

/*	Going to try making a scroll bar as the visual. I'll do both scroll bar and the 
	I could try doing an alphabetical search but id need to rewrite this.
	Actually prob not, eh nvm since I'm doing a system where both the document pages and the
	selection can be altered simultaneously, I can't just simply do a basic extra menu to go to.
	Eh, i wont worry about it now, make sure that documents are always organized in alphabetical order,
	and yea, I'll debate on adding it if the amount gets big.
	Actually, might be cooler to handle it with a togglable organizer option by just pressing Z:
		ALPHABETICAL ORDER		A -> Z				Z -> A
		COLLECTED HISTORY		OLDEST FIRST		NEWEST FIRST
	For colleced order, id just need to store the total game time (by save file), and whenever it gets
	added to the documents inventory, the time is saved to the array item itself.
	I'll handle the time order when I get around to saves.
*/

if (array_length(global.inventory.docs) == 0) { // EMPTY
	_indicator_color = c_outp_lticon;
	_final_indicator_text = "– EMPTY –";
} else { // INDICATE
	_indicator_color = c_gray;
	_final_indicator_text = _indicator_num + " / " + _indicator_total;
}

draw_text_color(
	_box_x + ((indicator_width + string_width(_final_indicator_text)) / 2) - string_width(_final_indicator_text) + 0.5,
	_box_y + ((indicator_height + string_height(_final_indicator_text)) / 2) - string_height(_final_indicator_text) + 0.5,
	_final_indicator_text,
	_indicator_color, _indicator_color, _indicator_color, _indicator_color,
	text_alpha);

#endregion

#region Draw Document Underlay
if (array_length(global.inventory.docs) > 0) {
	var _doc_width = (CAMERA_WIDTH / 2) - 32 + 12;
	var _doc_height = CAMERA_HEIGHT - (2 * 8);
	
	_box_x = textbox_x + (CAMERA_WIDTH - _doc_width - 8);
	_box_y = textbox_y + 8;
	
	var _doc_x_offset = instance_exists(obj_textbox) ? obj_textbox.anim_x_offset : 0;
	if (
		!instance_exists(obj_textbox) ||
		(instance_exists(obj_textbox) && (obj_textbox.create_anim || obj_textbox.delete_anim)) ||
		help_me_anim == 1
	) {
		draw_sprite_ext(
			box_spr, box_img,
			_box_x + _doc_x_offset,
			_box_y,
			_doc_width / box_spr_width,
			_doc_height / box_spr_height,
			0, c_black, box_alpha);
	}
}
#endregion

#region Ordered List Selection
if (array_length(global.inventory.docs) > 1) {
	//orderbox
	_box_x = textbox_x + 8 + indicator_width + 1;
	_box_y = textbox_y + 8;

	draw_sprite_ext(
		box_spr, box_img,
		_box_x,
		_box_y,
		orderbox_width / box_spr_width,
		orderbox_height / box_spr_height,
		0, c_black, box_alpha);

	var _order_text = order_option[order_value] + " Order";
	var _order_color = c_white;
	draw_text_color(
		_box_x + ((orderbox_width + string_width(_order_text)) / 2) - string_width(_order_text) + 0.5,
		_box_y + ((orderbox_height + (string_height(_order_text) * 2)) / 2) - (string_height(_order_text) * 2) + 0.5,
		_order_text,
		_order_color, _order_color, _order_color, _order_color,
		text_alpha);

	var _scending_text = scending_option[scending_value] + " Order";
	var _scending_color = scending_value == 0 ? c_yellow : c_aqua;
	draw_text_color(
		_box_x + ((orderbox_width + string_width(_scending_text)) / 2) - string_width(_scending_text) + 0.5,
		_box_y + ((orderbox_height + (string_height(_scending_text) * 2)) / 2) - string_height(_scending_text) + 0.5,
		_scending_text,
		_scending_color, _scending_color, _scending_color, _scending_color,
		text_alpha);
}
#endregion

#region Draw Everything
var _op_space = 2; // Space between icons.


#region The Scroll Buffer
var _view_limit = 13; //15 is default rn

if (array_length(global.inventory.docs) > 1) {
	if (controls_locked == false) {
		if (down_key_pressed) {
			scroll_buffer_bound = "D";
			next_anim = true;
			anim_y_offset = 2;
		}
		if (up_key_pressed) {
			scroll_buffer_bound = "U";
			prev_anim = true;
			anim_y_offset = -2;
		}
	}
}
// All of these need to be like this otherwise everything will break or be misaligned somehow.

// Only does the buffer if it needs to, otherwise stuff will break.
if (array_length(global.inventory.docs) > _view_limit) {
	if (option_pos == 0) {
		// Start of the page
		first_op_calc = 0;
	}
	if (option_pos == array_length(global.inventory.docs) - 1) {
		// At the end of the page
		first_op_calc = option_pos - (_view_limit - 1);
	}

	if (scroll_buffer_bound == "D") || (option_pos == array_length(global.inventory.docs) - 1) {
		if (option_pos == array_length(global.inventory.docs) - 1) {
			// At the end of the page
			first_op_calc = option_pos - (_view_limit - 1);
		} else if (option_pos > _view_limit - 2) && (option_pos == first_op_calc + (_view_limit - 1)) {
			// If the selection position starts moving to scroll.
			// Only becomes active when the selection reaches a high enough threshold for it to offset.
			first_op_calc = option_pos - (_view_limit - 2);
		}
	} else if (scroll_buffer_bound == "U") || (option_pos == 0) {
		if (option_pos == 0) {
			// Start of the page
			first_op_calc = 0; //option_pos - (_view_limit - 1);
		} else if (option_pos >= 1) && (option_pos == first_op_calc) {
			first_op_calc = option_pos - 1;
		}
	}
}
var _first_op = first_op_calc;
var _last_op = _first_op + (_view_limit - 1);
#endregion

#region Menu Box
_box_x = textbox_x + 8;
_box_y = textbox_y + _textbox_y_offset + 14; //27;
// Draw Menu
draw_sprite_ext(
	box_spr, box_img,
	_box_x + action_box_anim_x,
	_box_y + action_box_anim_y,
	textbox_width / box_spr_width,
	textbox_height / box_spr_height,
	0, c_black, box_alpha);
#endregion

var _usage_length = option_number < _view_limit ? _view_limit : array_length(global.inventory.docs);
for (var i = _first_op; i < _usage_length; i++) {
	
	#region Values
	var _op_board = 4;
	// option boxes
	var _op_spacing = 0;
	var _text_x_offset = 8;
	var _text_y_offset = 5.5;
	
	
	var _color = c_white;
	
	var _color_new = $00FFFF;
	var _color_seen = $80FFFF;
	
	var _color_selected = c_outp_orange;
	var _color_empty = c_gray;
	
	var _final_col = 0;
	var _final_text = 0;
	#endregion
	
	#region Color & Text Determiners
	if (i < option_number) { // Current Documents
		
		_color_new = global.inventory.docs[i].col_new;
		_color_seen = global.inventory.docs[i].col_seen;
		
		// add up prior option sizes
		for (var j = 0; j < i; j++) {
			if (i != 0) _op_spacing = (string_height(option[i - 1]) + 2) * (i - _first_op);
		}
		// selected option & option text
		//_final_text = string(global.inventory.docs[i].time_created) + global.inventory.docs[i].name; //option[i];
		_final_text = global.inventory.docs[i].name; //option[i];
		if (option_pos == i) _final_col = _color_selected;
		else if (global.inventory.docs[i].read_status == 0) _final_col = _color_new;
		else if (global.inventory.docs[i].read_status == 1) _final_col = _color_seen;
		else _final_col = _color;
		
		
		#region selector for clarity
		if (array_length(global.inventory.docs) > 0) {
			var _selector_icon = ""; //option_pos == i ? "›" : "·";
			var _selector_col = 0; //option_pos == i ? c_outp_orange : c_gray;
			if (option_pos == i) {
				_selector_icon = "›";
				_selector_col = c_outp_orange;
			} else if (global.inventory.docs[i].read_status == 0) {
				_selector_icon = "•";
				_selector_col = c_yellow;
			} else if (global.inventory.docs[i].read_status == 1) {
				_selector_icon = "·";
				_selector_col = c_yellow;
			} else {
				_selector_icon = "·";
				_selector_col = c_gray;
			}
			//	→	>	–	•	>	•	■	›
			//			·	·	-	-	•	·
			draw_text_color(
				_box_x + _text_x_offset + action_box_anim_x - 6,
				_box_y + _op_spacing + 1 + _text_y_offset + action_box_anim_y,
				_selector_icon,
				_selector_col, _selector_col, _selector_col, _selector_col, text_alpha);
		}
		#endregion
	} else if (option_number < _view_limit) { // Empty Spaces
		var _empty_text = "––––––––––––––––––––";
		//				  "[OOOOOOOOOOOOOOOOOO]";
		//	-	_	–
		//for (var i = 0; i < 20; i++) _empty_text += "O";
		
		// add up prior option sizes
		for (var j = 0; j < i; j++) {
			if (i != 0) _op_spacing = (string_height(_empty_text) + 2) * (i - _first_op);
		}
		
		_final_text = _empty_text;
		_final_col = _color_empty;
	}
	#endregion
	
	#region Handle Option Positions And Draw Code
	if (i >= _first_op && i < _first_op + _view_limit) {
		// Draws All Of The Text
		draw_text_color(
			_box_x + _text_x_offset + action_box_anim_x,
			_box_y + _op_spacing + 1 + _text_y_offset + action_box_anim_y,
			_final_text,
			_final_col, _final_col, _final_col, _final_col, text_alpha);
		
		// Overlay for the scroll
		if ((i == _first_op) && (_first_op > 0))
		|| ((i == _last_op) && (_last_op != array_length(global.inventory.docs) - 1)) {
			var _scroll_color = c_black;
			var _scroll_transparancy = option_number < _view_limit ? 0 : 0.65;
			
			draw_text_color(
				_box_x + _text_x_offset + action_box_anim_x,
				_box_y + _op_spacing + 1 + _text_y_offset + action_box_anim_y,
				_final_text,
				_scroll_color, _scroll_color, _scroll_color, _scroll_color, text_alpha * _scroll_transparancy);
		}
	}
	#endregion

}
#endregion