
get_controls();

// Draws and can be interacted with only if it's allowed to.

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

var _textbox_x_offset = 8;//CAMERA_WIDTH - (textbox_width + 8);//64;
var _textbox_y_offset = 8;

box_img += box_spd;

#region Animations

// Seriously debate on turning this into a case statement.

if (help_me_anim == 1) { // Creation Anim
	box_alpha += 0.1;
	text_alpha += 0.1;
	anim_y_offset -= 1;
	
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
	box_alpha -= 0.1; // 0.05 for testing, 0.2 is normal
	text_alpha -= 0.1;
	anim_y_offset += 1;
	
	if (text_alpha <= 0) {
		//if (help_me_anim != -1) 
		//	help_me_anim = -1;
		instance_destroy();
	}
}
if (help_me_anim == 3) { // Deletion Anim (warp to main menu specifically)
	box_alpha -= 0.05; // 0.05 for testing, 0.2 is normal
	text_alpha -= 0.05;
	anim_y_offset += 1;
	
	if (text_alpha <= 0 && !instance_exists(obj_warp_anim)) {
		if (is_struct(save_slot_data[selected_slot])) {
			load_game_slot(selected_slot);
		} else {
			//warp_player(rm_title_screen, 0, 0, 0);
			start_new_game();
		}
	}
}
if (help_me_anim == 4) { // Become Trans Anim
	box_alpha -= 0.1;
	text_alpha -= 0.1;
	
	if (box_alpha <= 0.5) {
		help_me_anim = 0;
		box_alpha = 0.5;
		text_alpha = 0.5; // trans alpha
	}
}
if (help_me_anim == 5) { // Become Not Trans Anim
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

#region Background Tint

if (help_me_anim == 3) {
	gpu_set_blendmode(bm_add);
	draw_sprite_tiled_ext(
		spr_warp_anim, 0, 0, 0,
		1, 1,
		c_outp_orange,
		0.5);
	gpu_set_blendmode(bm_normal);
	draw_sprite_tiled_ext(
		spr_warp_anim, 0, 0, 0,
		1, 1,
		c_black,
		0.6);
} else {
	// background (darkens)
	gpu_set_blendmode(bm_add);
	draw_sprite_tiled_ext(
		spr_warp_anim, 0, 0, 0,
		1, 1,
		c_outp_orange,
		box_alpha * 0.5);
	gpu_set_blendmode(bm_normal);
	draw_sprite_tiled_ext(
		spr_warp_anim, 0, 0, 0,
		1, 1,
		c_black,
		box_alpha * 0.6);
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
//if (next_anim || prev_anim) {
	//action_box_anim_x = 0;
	//action_box_anim_y = 0;
//}



#endregion




#region Draw Slots
var _op_space = 2; // Space between icons.

#region The Scroll Buffer
var _view_limit = 4; //15 is default rn

if (slot_number > 1 && help_me_anim == 0) {
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
if (slot_number > _view_limit) {
	if (selected_slot == 0) {
		// Start of the page
		first_op_calc = 0;
	}
	if (selected_slot == slot_number - 1) {
		// At the end of the page
		first_op_calc = selected_slot - (_view_limit - 1);
	}

	if (scroll_buffer_bound == "D") || (selected_slot == slot_number - 1) {
		if (selected_slot == slot_number - 1) {
			// At the end of the page
			first_op_calc = selected_slot - (_view_limit - 1);
		} else if (selected_slot > _view_limit - 2) && (selected_slot == first_op_calc + (_view_limit - 1)) {
			// If the selection position starts moving to scroll.
			// Only becomes active when the selection reaches a high enough threshold for it to offset.
			first_op_calc = selected_slot - (_view_limit - 2);
		}
	} else if (scroll_buffer_bound == "U") || (selected_slot == 0) {
		if (selected_slot == 0) {
			// Start of the page
			first_op_calc = 0; //selected_slot - (_view_limit - 1);
		} else if (selected_slot >= 1) && (selected_slot == first_op_calc) {
			first_op_calc = selected_slot - 1;
		}
	}
}
var _first_op = first_op_calc;
var _last_op = _first_op + (_view_limit - 1);
#endregion

#region Menu Box
_box_x = textbox_x + _textbox_x_offset;
_box_y = textbox_y + _textbox_y_offset;
// Draw Menu
draw_sprite_ext(
	box_spr, box_img,
	_box_x + action_box_anim_x,
	_box_y + action_box_anim_y,
	textbox_width / box_spr_width,
	textbox_height / box_spr_height,
	0, c_outp_orange, box_alpha);
#endregion

#region Draw Slots & Scroll Buffer
_box_x = textbox_x + _textbox_x_offset + 8;
_box_y = textbox_y + _textbox_y_offset + 8 + 0.5;
for (var i = _first_op; i < slot_number; i++) {
	
	#region Values
	var _op_board = 4;
	// option boxes
	var _op_spacing = 0;
	//var _text_x_offset = 8;
	//var _text_y_offset = 8 + 0.5;
	
	
	var _color = slot_was_selected ? c_outp_lticon : c_black;
	var _color_sel = c_white;
	//var _color_empty = c_gray;
	var _final_col = 0;
	var _final_text = 0;
	#endregion
	
	for (var j = 0; j < i; j++) {
		if (i != 0) _op_spacing = (slotbox_height + 1) * (i - _first_op);
	}
	
	#region Handle Draw Code
	if (i >= _first_op && i < _first_op + _view_limit) {
		var _selector_col = selected_slot == i ? _color_sel : _color;
		
		draw_sprite_ext(
			box_spr, box_slot_img,
			_box_x + action_box_anim_x,
			_box_y + _op_spacing + action_box_anim_y,
			slotbox_width / box_spr_width,
			slotbox_height / box_spr_height,
			0, _selector_col, box_alpha);
		
		#region Draw Slot Data & Images
		
		// Slot Number
		var _slot_str = i < 10 ? "SLOT 0" + string(i) : "SLOT " + string(i);
		
		draw_text_color(
			//_box_x + action_box_anim_x + ((slotbox_height - (string_width(_slot_str) - 1)) / 2),
			//_box_y + _op_spacing + action_box_anim_y + slotbox_height - string_height(_slot_str),
			_box_x + action_box_anim_x + (slotbox_width - (string_width(_slot_str) + 2)),
			_box_y + _op_spacing + action_box_anim_y + slotbox_height - string_height(_slot_str) - 1,
			_slot_str,
			_selector_col, _selector_col, _selector_col, _selector_col, text_alpha);
		
		if (is_struct(save_slot_data[i])) {
			#region Draw Character Image
			draw_sprite_ext(
				box_spr, box_slot_img,
				_box_x + action_box_anim_x,
				_box_y + _op_spacing + action_box_anim_y,
				slotbox_height / box_spr_width,
				slotbox_height / box_spr_height,
				0, _selector_col, box_alpha);
			
			/*	4/24/2025
				For now it can stay as Costel but will need to be adjusted
				for when other characters are playable (i.e. Rianne).
				Speaking of, need to also make it better that the saved character is only handled with one value,
				not separate regarding the name too, would be easier like that to then just pull data from a switch
				or an array I suppose.
			*/
			var _portrait_col = selected_slot == i ? c_white : c_outp_orange;
			
			draw_sprite_part_ext(
				spr_portrait_costelA, 0,
				0 * 32,
				0 * 32,
				32, 32,
				_box_x + action_box_anim_x + 2,
				_box_y + _op_spacing + action_box_anim_y + 2,
				1, 1,
				_portrait_col, box_alpha);
			#endregion
			
			#region Draw Last Save Time
			var _date_time = date_datetime_string(save_slot_data[i].save_time) + "\n" +
				string(save_slot_data[i].playtime);
			draw_text_color(
				_box_x + action_box_anim_x + slotbox_height + 2,
				_box_y + _op_spacing + action_box_anim_y + 2,
				_date_time,
				_selector_col, _selector_col, _selector_col, _selector_col, text_alpha);
			#endregion
			
			#region Draw Name & Room
			var _name_room_str = string(save_slot_data[i].char) + "\n" + get_save_point_room_names(save_slot_data[i].saved_rm); //string(save_slot_data[i].saved_rm_name);
			draw_text_color(
				_box_x + action_box_anim_x + slotbox_height + 2,
				_box_y + _op_spacing + action_box_anim_y + slotbox_height - string_height(_name_room_str) - 1,
				_name_room_str,
				_selector_col, _selector_col, _selector_col, _selector_col, text_alpha);
			#endregion
		} else {
			// Empty Text
			var _empty_str = "E M P T Y";
			draw_text_color(
				//_box_x + action_box_anim_x + (((slotbox_width + slotbox_height) - (string_width(_empty_str))) / 2),
				_box_x + action_box_anim_x + (((slotbox_width) - (string_width(_empty_str))) / 2),
				_box_y + _op_spacing + action_box_anim_y + ((slotbox_height - (string_height(_empty_str))) / 2),
				_empty_str,
				_selector_col, _selector_col, _selector_col, _selector_col, text_alpha);
		}
		#endregion
	}
	#endregion

}
#endregion
#endregion

#region Settings Box

_box_x = textbox_x + _textbox_x_offset + (textbox_width - op_box_width) - 8;
_box_y = textbox_y + _textbox_y_offset + 8;

var _settings_box_col = slot_was_selected ? c_white : c_outp_lticon;

// Box
draw_sprite_ext(
	box_spr, box_slot_img,
	_box_x + action_box_anim_x,
	_box_y + action_box_anim_y,
	op_box_width / box_spr_width,
	op_box_height / box_spr_height,
	0, _settings_box_col, box_alpha);

// Draw Logo
var _logo_color = room == rm_title_screen ? c_white : c_outp_lticon;
draw_sprite_ext(
	spr_ingame_logo, 2,
	_box_x + action_box_anim_x + (op_box_width * 0.5),
	_box_y + action_box_anim_y + (op_box_width * 0.5),
	1, 1,
	0, _logo_color, box_alpha);
#endregion

#region Currently Loaded Save Info
if (room != rm_title_screen) {
	var _room_name = get_save_point_room_names();
	var _room_name_width = string_width(_room_name) - 1;
	var _room_name_height = string_height(_room_name);
	
	draw_text_color(
		round(_box_x + action_box_anim_x + ((op_box_width - _room_name_width) / 2)),
		_box_y + action_box_anim_y + ((op_box_width - _room_name_height) / 2),
		_room_name,
		_color_sel, _color_sel, _color_sel, _color_sel, text_alpha);
}
#endregion

#region Selection Indicator

var _indicator_num = selected_slot;
var _indicator_total = slot_number - 1;
var _indicator_color = _settings_box_col;

if (_indicator_num < 10) _indicator_num = "0" + string(selected_slot);

var _final_indicator_text = "SLOT " + string(_indicator_num);

draw_text_color(
	_box_x + action_box_anim_x + ((op_box_width - (string_width(_final_indicator_text) - 1)) / 2),
	_box_y + action_box_anim_y + 5,
	_final_indicator_text,
	_indicator_color, _indicator_color, _indicator_color, _indicator_color,
	text_alpha);

#endregion

#region Options

for (var i = 0; i < option_number; i++) {
	
	var _op_width = string_width(option[i]) - 1;
	//var _op_space = string_height(option[i]) + 1 + 2;
	var _op_space = 10;
	var _op_spacing = 0;
	var _text_x_offset = 0;
	var _text_y_offset = op_box_height - ((string_height(option[i]) + 1) * (option_number));
	// add up prior option sizes
	for (var j = 0; j < i; j++) {
		if (i != 0) _op_spacing = (string_height(option[i - 1]) + 1) * i;
	}
	
	
	var _color_sel = option_pos == i ? c_white : c_black;
	if (!is_struct(save_slot_data[selected_slot])) {
		
		// Stuff that you cannot perform.
		if (
			(option[i] == "LOAD" && room != rm_title_screen) ||
			option[i] == "COPY" ||
			option[i] == "DELETE"
		) {
			_color_sel = option_pos == i ? c_outp_altorange : c_outp_lticon;
		}
		// Cannot Copy Or Delete an empty file.
		// Loading results in asking if you want to do a new game instead.
	}
	
	if (!slot_was_selected) _color_sel = c_outp_lticon;
	
	// selected option & option text
	draw_text_color(
		_box_x + _text_x_offset + action_box_anim_x + ((op_box_width - _op_width) / 2),
		_box_y + _op_spacing + _text_y_offset + action_box_anim_y,
		option[i],
		_color_sel, _color_sel, _color_sel, _color_sel, text_alpha);

}
#endregion