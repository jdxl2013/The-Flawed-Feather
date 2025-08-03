
// DRAW TIMER INFORMATION

if (global.debug.is_enabled) {

	draw_set_font(FONT);
	var _fnt_size = font_get_size(FONT); 

	var _timer_str = "";

	///////////
	if (instance_exists(obj_textbox)) _timer_str += "\ntextbox exists\n";

	for (var i = 0; i < array_length(global.timers); i++) {
	
		var e = array_get(global.timers, i);
		_timer_str += "\n" + e.name + " : " + string(e.timer);
		if (e.timer <= 0) {
			_timer_str += "\n" + e.name + " : WAIT FOR";
		}

	}

	if (depth != obj_current_time.depth + 1) depth = obj_current_time.depth + 1;

	draw_set_color(c_black);
	draw_text_ext_transformed(
		obj_camera.x - (CAMERA_WIDTH / 2) + 2 - 1,
		obj_camera.y - (string_height(_timer_str) / 2) - 1,
		"CURRENT TIMERS:" + _timer_str,
		_fnt_size + 2, 2 * (CAMERA_WIDTH - 1),
		1, 1, 0);

	draw_set_color(c_outp_altorange);
	draw_text_ext_transformed(
		obj_camera.x - (CAMERA_WIDTH / 2) + 2,
		obj_camera.y - (string_height(_timer_str) / 2),
		"CURRENT TIMERS:" + _timer_str,
		_fnt_size + 2, 2 * (CAMERA_WIDTH - 1),
		1, 1, 0);

	#endregion

	// Unties this with other text like the textbox
	draw_set_color(c_white);
	draw_set_alpha(1);

}