#region Debugging Stuff
if (global.debug.is_enabled) {
	// Camera Center Debug
	if (keyboard_check_pressed(ord("W")) and image_alpha == 0)
		image_alpha = 1;
	else if (keyboard_check_pressed(ord("W")) and image_alpha == 1)
		image_alpha = 0.5;
	else if (keyboard_check_pressed(ord("W")) and image_alpha == 0.5)
		image_alpha = 0;
	
	#region Draw Go To Target
	draw_sprite_ext(
		spr_camera, 0,
		x_to, y_to,
		1, 1,
		0, c_orange, image_alpha
	);
	draw_text_ext_color(
		x_to - 16, y_to + 17,
		"X:" + string(x_to) + "\nY:" + string(y_to),
		6, 999,
		c_orange, c_orange, c_orange, c_orange,
		image_alpha
	);
	#endregion
	
	#region Draw Camera
	draw_sprite_ext(
		spr_camera, 0,
		x, y,
		1, 1,
		0, c_white, image_alpha
	);
	
	var _color_x = (x >= 0 && x <= room_width) ? c_white : c_red;
	draw_text_ext_color(
		x - 16, y + 17,
		"X:" + string(round(x)),
		6, 999,
		_color_x, _color_x, _color_x, _color_x,
		image_alpha
	);
	var _color_y = (y >= 0 && y <= room_height) ? c_white : c_red;
	draw_text_ext_color(
		x - 16, y + 17,
		"\nY:" + string(round(y)),
		6, 999,
		_color_y, _color_y, _color_y, _color_y,
		image_alpha
	);
	#endregion
}
#endregion