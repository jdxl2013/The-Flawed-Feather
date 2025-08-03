
if (array_length(cg_array) > 0) {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	
	var _cg = array_get(cg_array, current_scene_of_array);
	
	#region Handle Frames
	if (!is_paused) {
		x_frame += _cg.frame_speed;
		if (x_frame >= _cg.sheet_width) {
			x_frame = 0;
			y_frame += 1;
		}
	}
	#endregion
	
	#region Draw Image
	draw_sprite_part_ext(
		_cg.sprite_sheet, 0,
		
		floor(x_frame) * _cg.size_width,
		floor(y_frame) * _cg.size_height,
		
		_cg.size_width,
		_cg.size_height,
		
		_x + round((CAMERA_WIDTH - _cg.size_width) / 2) + _cg.drawn_x_offset,
		_y + round((CAMERA_HEIGHT - _cg.size_height) / 2) + _cg.drawn_y_offset,
		
		1, 1,
		c_white, 1);
	#endregion
	
	#region Handle Scene Progression
	// Calculate Current Frame Of Sheet
	current_frame = (_cg.sheet_width * y_frame) + x_frame;
	
	if (is_looping) {
		if (current_frame >= looping_end - _cg.frame_speed) {
			cutscene_cg_set_frame(looping_start, _cg.sheet_width);
		}
	} else if (current_frame >= _cg.frame_end - _cg.frame_speed) {
		
		if (!is_looping) {
			current_scene_of_array++;
		}
		
		if (current_scene_of_array < array_length(cg_array)) {
			cutscene_cg_set_values(current_scene_of_array);
		} else {
			cg_array = array_create(0);
		}
	}
	#endregion
}
