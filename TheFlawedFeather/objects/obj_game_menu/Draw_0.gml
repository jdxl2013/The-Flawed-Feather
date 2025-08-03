
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]);

//var _textbox_x_offset = ((CAMERA_WIDTH + textbox_width) / 2) - textbox_width;
//var _textbox_y_offset = ((CAMERA_HEIGHT + textbox_height) / 2) - textbox_height + 32;

var _textbox_x_offset = 8;
var _textbox_y_offset = 8;

box_img += box_spd;


#region Animations

// Seriously debate on turning this into a case statement.

if (help_me_anim == 1) { // Creation Anim
	box_alpha += 0.2;
	text_alpha += 0.2;
	
	anim_x_offset += 1;
	//anim_x_offset += -anim_x_offset / 3;
	
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
		audio_play_sound(snd_menu_close, 3, false);
		instance_destroy();
	}
}
if (help_me_anim == 3) { // Deletion Anim (warp to main menu specifically) (DELETE LATER, I MOVED IT TO OBJ_EXIT_MENU)
	box_alpha -= 0.05; // 0.05 for testing, 0.2 is normal
	text_alpha -= 0.05;
	anim_x_offset -= 1;
	
	if (text_alpha <= 0 && !instance_exists(obj_warp_anim)) {
		instance_destroy();
		warp_player(rm_title_screen, 0, 0, 0);
		// scr should now destroy the player when going here
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

#endregion


var _box_x = textbox_x + _textbox_x_offset;
var _box_y = textbox_y + _textbox_y_offset;

// Draw Menu
draw_sprite_ext(
	box_spr, box_img,
	_box_x + anim_x_offset,
	_box_y + anim_y_offset,
	textbox_width / box_spr_width,
	textbox_height / box_spr_height,
	0, c_black, box_alpha);

#region OPTIONS
for (var i = 0; i < option_number; i++) {
	
	// option boxes
	var _op_width = string_width(option[i]) + (option_draw_y_offset * 2);
	//var _op_space = string_height(option[i]) + 1 + 2;
	var _op_space = 10;
	var _op_spacing = 0;
	var _text_x_offset = 8;
	var _text_y_offset = option_draw_y_offset;
	// add up prior option sizes
	for (var j = 0; j < i; j++) {
		if (i != 0) _op_spacing += option_draw_height;
		//string_height(option[i - 1]) + 2;
	}
	// selected option & option text
	if (option_pos == i) {
		draw_text_color(
			_box_x + _text_x_offset + anim_x_offset,
			_box_y + _op_spacing + 1 + _text_y_offset + anim_y_offset,
			option[i],
			c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange, text_alpha);
	} else {
		draw_text_color(
			_box_x + _text_x_offset + anim_x_offset,
			_box_y + _op_spacing + 1 + _text_y_offset + anim_y_offset,
			option[i],
			c_white, c_white, c_white, c_white, text_alpha);
	}
}
#endregion