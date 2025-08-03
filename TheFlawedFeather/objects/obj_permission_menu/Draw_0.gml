textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

//var _textbox_x_offset = ((CAMERA_WIDTH + textbox_width) / 2) - textbox_width;
//var _textbox_y_offset = ((CAMERA_HEIGHT + textbox_height) / 2) - textbox_height + 32;

var _textbox_x_offset = ((CAMERA_WIDTH + textbox_width) / 2) - textbox_width;
var _textbox_y_offset = ((CAMERA_HEIGHT + textbox_height) / 2) - textbox_height;

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
	box_alpha -= 0.1; // 0.05 for testing, 0.15 is normal
	text_alpha -= 0.1;
	anim_y_offset += 1;
	
	if (text_alpha <= 0) {
		instance_destroy();
	}
}
if (help_me_anim == 3) { // Deletion Anim (warp to main menu specifically)
	box_alpha -= 0.05; // 0.05 for testing, 0.2 is normal
	text_alpha -= 0.05;
	anim_y_offset += 1;
	
	if (text_alpha <= 0 && !instance_exists(obj_warp_anim)) {
		warp_player(rm_title_screen, 0, 0, 0);
		// Now gets destroyed in the warp obj.
	}
}

#endregion


var _box_x = textbox_x + _textbox_x_offset;
var _box_y = textbox_y + _textbox_y_offset;


if (help_me_anim == 3) {
	gpu_set_blendmode(bm_add);
	draw_sprite_tiled_ext(
		spr_warp_anim, 0, 0, 0,
		1, 1,
		c_outp_altorange,
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
		//c_outp_icon,
		//c_black,
		c_outp_altorange,
		//$090A1C,
		box_alpha * 0.5);
	gpu_set_blendmode(bm_normal);
	draw_sprite_tiled_ext(
		spr_warp_anim, 0, 0, 0,
		1, 1,
		c_black,
		box_alpha * 0.6);
}


// Draw Menu
draw_sprite_ext(
	box_spr, box_img,
	_box_x + anim_x_offset,
	_box_y + anim_y_offset,
	textbox_width / box_spr_width,
	textbox_height / box_spr_height,
	0, c_outp_altorange, box_alpha);

// Draw Logo
draw_sprite_ext(
	spr_ingame_logo, 2,
	_box_x + (textbox_width / 2) + anim_x_offset,
	_box_y + (textbox_height / 3) - 4 + anim_y_offset,
	1,
	1,
	0, c_white, box_alpha);

var _text = info_text;
draw_set_halign(fa_center);
draw_text_ext_color(
	//_box_x + ((textbox_width + string_width(_text)) / 2) - string_width(_text) + anim_x_offset,
	_box_x + (textbox_width / 2) + anim_x_offset,
	_box_y + (textbox_height / 3) - ((string_height(_text) / 2) - 0.5) + 32 + anim_y_offset,
	_text,
	8, textbox_width - 8,
	c_outp_lticon, c_outp_lticon, c_outp_lticon, c_outp_lticon, text_alpha);


#region OPTIONS
for (var i = 0; i < option_number; i++) {
	
	var _op_board = 4;
	// option boxes
	var _op_width = string_width(option[i]) + (_op_board * 2);
	//var _op_space = string_height(option[i]) + 1 + 2;
	var _op_space = 10;
	var _op_spacing = 0;
	var _text_x_offset = (textbox_width / 2);
	var _text_y_offset = textbox_height - (string_height(option[0]) * option_number) - 16; //92;
	// add up prior option sizes
	for (var j = 0; j < i; j++) {
		if (i != 0) _op_spacing += string_height(option[i - 1]) + 2;
	}
	// selected option & option text
	if (option_pos == i) {
		draw_text_color(
			_box_x + _text_x_offset + anim_x_offset,
			_box_y + _op_spacing + 2 + _text_y_offset + anim_y_offset,
			option[i],
			c_white, c_white, c_white, c_white, text_alpha);
	} else {
		draw_text_color(
			_box_x + _text_x_offset + anim_x_offset,
			_box_y + _op_spacing + 2 + _text_y_offset + anim_y_offset,
			option[i],
			c_black, c_black, c_black, c_black, text_alpha);
	}
}
#endregion

draw_set_halign(fa_left);