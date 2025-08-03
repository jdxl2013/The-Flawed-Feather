
get_controls();

// Draws and can be interacted with only if it's allowed to.

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

//var _textbox_x_offset = ((CAMERA_WIDTH + textbox_width) / 2) - textbox_width;
//var _textbox_y_offset = ((CAMERA_HEIGHT + textbox_height) / 2) - textbox_height + 32;

var _textbox_x_offset = CAMERA_WIDTH - (textbox_width + 8);//64;
var _textbox_y_offset = 8;

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

#endregion


//var _xx = obj_camera.x - 128;
//var _yy = obj_camera.y + 64;
var _box_x = textbox_x + _textbox_x_offset;
var _box_y = textbox_y + _textbox_y_offset;
var _sep = 16;

#region Inventory Bar
// menu board
draw_sprite_ext(
	box_spr, box_img,
	_box_x + anim_x_offset,
	_box_y + anim_y_offset,
	textbox_width / box_spr_width,
	textbox_height / box_spr_height,
	0, c_black, box_alpha);

#region Selection Indicator
var _indicator_start = "";
var _indicator_end = "";
var _indicator_num = string(option_pos + 1);
var _indicator_total = string(array_length(global.inventory.items));
var _indicator_color = c_gray;
var _empty_text = "– EMPTY –";

if (_indicator_num < 10) _indicator_num = "0" + string(option_pos + 1);
if (_indicator_total < 10) _indicator_total = "0" + string(array_length(global.inventory.items));


if (array_length(global.inventory.items) == 0) { // If the inventory is empty.
	_indicator_color = c_outp_lticon;
	draw_text_color(
		_box_x + anim_x_offset + ((textbox_width + string_width(_empty_text)) / 2) - string_width(_empty_text),
		_box_y + anim_y_offset + 5 - 0.5,
		_empty_text,
		_indicator_color, _indicator_color, _indicator_color, _indicator_color,
		text_alpha);
} else {
	if (option_pos == 0) _indicator_start = "– ";
	else _indicator_start = "< ";
	if (option_pos == array_length(global.inventory.items) - 1) _indicator_end = " –";
	else _indicator_end = " >";
	
	/* draw_text_color(
		_box_x + anim_x_offset + 6,
		_box_y + anim_y_offset + 5 - 0.5,
		_indicator_start,
		_indicator_color, _indicator_color, _indicator_color, _indicator_color,
		text_alpha);
	draw_text_color(
		_box_x + anim_x_offset + textbox_width - 6 - string_width(_indicator_end),
		_box_y + anim_y_offset + 5 - 0.5,
		_indicator_end,
		_indicator_color, _indicator_color, _indicator_color, _indicator_color,
		text_alpha); */
	var _final_indicator_end = _indicator_start + _indicator_num + " / " + _indicator_total + _indicator_end;
	draw_text_color(
		_box_x + anim_x_offset + textbox_width - 5 - string_width(_final_indicator_end) - 1,
		_box_y + anim_y_offset + 5 - 0.5,
		_final_indicator_end,
		_indicator_color, _indicator_color, _indicator_color, _indicator_color,
		text_alpha);
}
#endregion

#region Draw Icons
var _op_width = 12; // Same width as the icons.
var _icon_view_limit = 12; //15 is default rn
var _op_space = 2; // Space between icons.

#region The Scroll Buffer

if (array_length(global.inventory.items) > 1) {
	if (controls_locked == false) {
		//if (keyboard_check_pressed(RIGHT)) {
		if (right_key_pressed) {
			scroll_buffer_bound = "R";
			next_anim = true;
			anim_x_offset = 2;
		}
		//if (keyboard_check_pressed(LEFT)) {
		if (left_key_pressed) {
			scroll_buffer_bound = "L";
			prev_anim = true;
			anim_x_offset = -2;
		}
	}
}
// All of these need to be like this otherwise everything will break or be misaligned somehow.

// Only does the buffer if it needs to, otherwise stuff will break.
if (array_length(global.inventory.items) > _icon_view_limit) {
	if (option_pos == 0) {
		// Start of the page
		first_op_calc = 0;
	}
	if (option_pos == array_length(global.inventory.items) - 1) {
		// At the end of the page
		first_op_calc = option_pos - (_icon_view_limit - 1);
	}

	if (scroll_buffer_bound == "R") || (option_pos == array_length(global.inventory.items) - 1) {
		if (option_pos == array_length(global.inventory.items) - 1) {
			// At the end of the page
			first_op_calc = option_pos - (_icon_view_limit - 1);
		} else if (option_pos > _icon_view_limit - 2) && (option_pos == first_op_calc + (_icon_view_limit - 1)) {
			// If the selection position starts moving to scroll.
			// Only becomes active when the selection reaches a high enough threshold for it to offset.
			first_op_calc = option_pos - (_icon_view_limit - 2);
		}
	} else if (scroll_buffer_bound == "L") || (option_pos == 0) {
		if (option_pos == 0) {
			// Start of the page
			first_op_calc = 0; //option_pos - (_icon_view_limit - 1);
		} else if (option_pos >= 1) && (option_pos == first_op_calc) {
			first_op_calc = option_pos - 1;
		}
	}
}
var _first_op = first_op_calc;
var _last_op = _first_op + (_icon_view_limit - 1);
#endregion

//for (var i = 0; i < array_length(global.inventory.items); i++) {
for (var i = _first_op; i < array_length(global.inventory.items); i++) {
	// option icons
	var _op_spacing = 0;
	// add up prior option sizes
	for (var j = 0; j < i; j++) {
		
		if (i != 0) _op_spacing = (_op_width + _op_space) * (i - _first_op);
	}
	
	// selected option & option text
	var _color = c_white;
	// gray out indicating the ability to scroll
	if ((i == _first_op) && (_first_op > 0))
	|| ((i == _last_op) && (_last_op != array_length(global.inventory.items) - 1)) {
		_color = c_gray;
	}
	
	if (option_pos == i) {
		_color = c_outp_orange;
	}
	
	//if (option_pos <= _icon_view_limit - 1) {
	//for (var j = option_pos - _icon_view_limit; j <= option_pos; j++) {
	//for (var j = 0; j < array_length(global.inventory.items); j++) {
	if (i < _first_op + _icon_view_limit) {
		draw_sprite_ext(
			global.inventory.items[i].icon_spr, global.inventory.items[i].icon_index,
			_box_x + _op_spacing + anim_x_offset + 4 + 2,// 12 - 11 + 1,
			_box_y + anim_y_offset + 2,
			1, 1,
			0, _color, text_alpha);
	}
	
	//}
	/*
	draw_text_color(
		_box_x + _op_spacing,
		_box_y,
		option[i],
		c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha); */
}
#endregion
#endregion

#region Item Info
if (array_length(global.inventory.items) != 0) {
	#region Item Image
	var _image_box_x = textbox_width - image_box_width;
	var _image_box_y = textbox_height + 1;
	// Image Box
	draw_sprite_ext(
		box_spr, box_img,
		_box_x + anim_x_offset + _image_box_x,
		_box_y + anim_y_offset + _image_box_y,
		image_box_width / box_spr_width,
		image_box_height / box_spr_height,
		0, c_black, box_alpha);
	// Actual Image
	draw_sprite_ext(
		global.inventory.items[option_pos].inv_spr, global.inventory.items[option_pos].inv_index,
		//_box_x + anim_x_offset + _image_box_x + (sprite_get_width(global.inventory.items[option_pos].inv_spr) / 2),
		//_box_y + anim_y_offset + _image_box_y + (sprite_get_height(global.inventory.items[option_pos].inv_spr) / 2),
		_box_x + anim_x_offset + _image_box_x + (image_box_width / 2),
		_box_y + anim_y_offset + _image_box_y + (image_box_height / 2),
		1, 1,
		0, c_white, box_alpha);
	#endregion
	#region Item Description
	
	var _info_box_x = _image_box_x - info_box_width - 1;
	var _info_box_y = _image_box_y;
	// Image Box
	draw_sprite_ext(
		box_spr, box_img,
		_box_x + anim_x_offset + _info_box_x,
		_box_y + anim_y_offset + _info_box_y,
		info_box_width / box_spr_width,
		info_box_height / box_spr_height,
		0, c_black, box_alpha);
	// Info Text
	var _text_border = 8;
	var _line_sep = 8;
	var _line_width = info_box_width - (_text_border * 2) + 1;
	draw_text_ext_color(
		_box_x + _info_box_x + _text_border + anim_x_offset,
		_box_y + _info_box_y + _text_border - 2 + anim_y_offset,
		global.inventory.items[option_pos].description,
		_line_sep, _line_width,
		c_white, c_white, c_white, c_white, text_alpha);
	
	// Draw Item Name
	if (global.inventory.items[option_pos].name != "") {
		var _name_space = 10;
		var _name_board = 4;
		var _name_width = string_width(global.inventory.items[option_pos].name) + (_name_board * 2);
		
		draw_sprite_ext(
			box_spr, box_img,
			_box_x + _info_box_x + ((info_box_width + _name_width) / 2) - _name_width + anim_x_offset,
			(_box_y + _info_box_y + info_box_height) - 4 + anim_y_offset,
			(_name_width + 1) / box_spr_width,
			(_name_space - 1) / box_spr_height,
			0, c_black, box_alpha);
		draw_text_color(
			_box_x + _info_box_x + (((info_box_width + _name_width) / 2) - _name_width) + (_name_board + 1) + anim_x_offset,
			(_box_y + _info_box_y + info_box_height) - 3 + anim_y_offset,
			global.inventory.items[option_pos].name,
			c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
	}
	
	#endregion
}
#endregion

#region Action Menu

// Does not get animated with each page movement
var action_box_anim_x = anim_x_offset;
var action_box_anim_y = anim_y_offset;
if (next_anim || prev_anim) {
	//action_box_anim_x = 0;
	//action_box_anim_y = 0;
}

_box_x = textbox_x + 8;
_box_y = textbox_y + _textbox_y_offset + 14; //27;
// Draw Menu
draw_sprite_ext(
	box_spr, box_img,
	_box_x + action_box_anim_x,
	_box_y + action_box_anim_y,
	action_box_width / box_spr_width,
	action_box_height / box_spr_height,
	0, c_black, box_alpha);

#region OPTIONS
for (var i = 0; i < main_option_number; i++) {
	
	var _op_board = 4;
	// option boxes
	_op_width = string_width(option[i]) + (_op_board * 2);
	//var _op_space = string_height(option[i]) + 1 + 2;
	_op_space = 10;
	var _op_spacing = 0;
	var _text_x_offset = 8;
	var _text_y_offset = 4;
	
	var _color = c_white;
	var _color_selected = c_outp_orange;
	if ((array_length(global.inventory.items) == 0) && (i != main_option_number - 1)) // If inventory is empty.
			|| ((array_length(global.inventory.items) != 0)
			&& (!is_string(global.inventory.items[option_pos].effect_id) && i == 0)) { // If the item can't be used (should be default to 0 in obj_item_manager) 
		// if action can't be used.
		_color = c_gray;
		_color_selected = c_outp_lticon;
	}
	
	// add up prior option sizes
	for (var j = 0; j < i; j++) {
		if (i != 0) _op_spacing += string_height(option[i - 1]) + 2;
	}
	// selected option & option text
	if (main_option_pos == i) {
		draw_text_color(
			_box_x + _text_x_offset + action_box_anim_x,
			_box_y + _op_spacing + 1 + _text_y_offset + action_box_anim_y,
			option[i],
			_color_selected, _color_selected, _color_selected, _color_selected, text_alpha);
	} else {
		draw_text_color(
			_box_x + _text_x_offset + action_box_anim_x,
			_box_y + _op_spacing + 1 + _text_y_offset + action_box_anim_y,
			option[i],
			_color, _color, _color, _color, text_alpha);
	}
}
#endregion

#endregion
