
if (is_starting_game) {
	not_logo_alpha += calc_compare_divide(not_logo_alpha, 0, 5);
	logo_alpha += calc_compare_divide(logo_alpha, 1, 15);
} else {
	not_logo_alpha = 1;
	logo_alpha = 0.5;
}

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

var _textbox_x_offset = ((CAMERA_WIDTH + textbox_width) / 2) - textbox_width;
var _textbox_y_offset = ((CAMERA_HEIGHT + textbox_height) / 2) - textbox_height + 32;

box_img += box_spd;

var _box_x = textbox_x + _textbox_x_offset;
var _box_y = textbox_y + _textbox_y_offset;

#region Draw Logo

//var _logo_anim += 30;

logo_anim += (1 / 1) / game_get_speed(gamespeed_fps);
if (logo_anim >= 3) logo_anim = 0;

var _logo_x = CAMERA_WIDTH / 2;
var _logo_y = floor(CAMERA_HEIGHT / 3);

draw_sprite_ext(
	spr_logo_ver2_b, logo_anim,
	_logo_x, _logo_y,
	1, 1,
	0, c_white, logo_alpha);

draw_sprite_ext(
	spr_ingame_logo, 3,
	_logo_x, _logo_y,
	1, 1,
	0, c_white, 1 * not_logo_alpha);

draw_sprite_ext(
	spr_logo_ver2_a2, 0,
	_logo_x, _logo_y + 7,
	1, 1,
	0, c_white, 1 * not_logo_alpha);
#endregion

#region Flavor Text
draw_text_color(
	//round(((CAMERA_WIDTH + string_width(flavor_text)) / 2) - string_width(flavor_text)),
	//round((CAMERA_HEIGHT / 3) - ((string_height(flavor_text) / 2) - 0.5) - 24),
	4, 4,
	flavor_text,
	//c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
	//c_white, c_white, c_white, c_white, text_alpha);
	//c_outp_lticon, c_outp_lticon, c_outp_lticon, c_outp_lticon, text_alpha);
	c_yellow, c_yellow, c_yellow, c_yellow, text_alpha * not_logo_alpha);
#endregion


#region Version Data

var _data_color = c_outp_icon;
draw_text_color(
	round((CAMERA_WIDTH - string_width(version_data)) - 3),
	CAMERA_HEIGHT - string_height(version_data) - 2,
	version_data,
	_data_color, _data_color, _data_color, _data_color,
	text_alpha * not_logo_alpha);
#endregion

// Draw Menu
draw_sprite_ext(
	box_spr, box_img,
	_box_x,
	_box_y,
	textbox_width / box_spr_width,
	textbox_height / box_spr_height,
	0, c_outp_orange, 0);
	//0, c_outp_orange, box_alpha);

#region OPTIONS
for (var i = 0; i < option_number; i++) {
	
	var _op_board = 4;
	// option boxes
	var _op_width = string_width(option[i]) + (_op_board * 2);
	//var _op_space = string_height(option[i]) + 1 + 2;
	var _op_space = 10;
	var _op_spacing = 0;
	
	var _text_x_offset = ((textbox_width + string_width(option[i])) / 2) - string_width(option[i]);
	//var _text_y_offset = ((textbox_height + (string_height(option[0]) * option_number)) / 2) - (string_height(option[0]) * option_number);
	
	// add up prior option sizes
	for (var j = 0; j < i; j++) {
		if (i != 0) _op_spacing += string_height(option[i - 1]) + 2;
	}
	
	
	//draw_rectangle_color(
	//	0, 
	//	_box_y + _op_spacing + 2,
	//	CAMERA_WIDTH,
	//	_box_y + _op_spacing + string_height(option[menu_level, i]) + 1,
	//	$090A1C, $090A1C, $090A1C, $090A1C, 0);

	
	// selected option & option text
	if (option_pos == i) {
		var _box_spr_width = sprite_get_width(spr_textbox);
		var _box_spr_height = sprite_get_height(spr_textbox);
		draw_sprite_ext(
			spr_textbox, 2,
			0,
			_box_y + _op_spacing + 1 - 0.5,
			CAMERA_WIDTH / _box_spr_width,
			(string_height(option[i]) + 2) / _box_spr_height,
			0, $00004C, 1 * not_logo_alpha);
		draw_text_color(
			_box_x + _text_x_offset,
			_box_y + _op_spacing + 2,
			option[i],
			//c_white, c_white, c_white, c_white, text_alpha);
			c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha * not_logo_alpha);
	} else {
		draw_text_color(
			_box_x + _text_x_offset,
			_box_y + _op_spacing + 2,
			//_box_x + _op_board + 1,
			//_box_y + _op_spacing + 2,
			option[i],
			//c_black, c_black, c_black, c_black, text_alpha);
			c_white, c_white, c_white, c_white, text_alpha * not_logo_alpha);
			//c_outp_icon, c_outp_icon, c_outp_icon, c_outp_icon, text_alpha);
	}
	
	
}
#endregion
