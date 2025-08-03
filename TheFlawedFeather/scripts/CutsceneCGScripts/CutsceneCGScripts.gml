
function cutscene_cg_run_id(_id) {
	with (obj_cutscene_cg_manager) {
		cutscene_cg_id_list(_id);
	}
}

///	@param	{Asset.GMSprite}	_sprite_sheet	Animated cutscene frames.
///	@param	{Real}				_sheet_width	Frames along the X axis of the sprite sheet.
///	@param	{Real}				_frame_start	Frame to start on. Lowerbound. First frame is 0.
///	@param	{Real}				_frame_end		Frame to end at. Upperbound. Do total frames if going for the entire animation.
/// @param	{Real}				_frame_speed	Seconds per frame.
function cutscene_cg_add(_sprite_sheet, _sheet_width, _frame_start, _frame_end, _frame_speed) constructor {
	sprite_sheet = _sprite_sheet;
	sheet_width = _sheet_width;
	frame_start = _frame_start;
	frame_end = _frame_end;
	frame_speed = (1 / _frame_speed) / game_get_speed(gamespeed_fps); // * delta_time;
	
	sound = 0;
	
	size_width = 320;
	size_height = 180;
	
	drawn_x_offset = 0;
	drawn_y_offset = 0;
	
	function_array = array_create(0);
}

/// @description Holds values for functions to run for.
///	@param	{Real}		_frame		Frame to run on in the sheet.
///	@param	{Function}	_function	Function to run.
function cutscene_cg_function(_frame, _function) constructor {
	frame = _frame;
	funct = _function;
	
	has_ran_funct = false;
}


///	@param	{Asset.GMSprite}	_sprite_sheet	Animated cutscene frames.
///	@param	{Real}				_sheet_width	Frames along the X axis of the sprite sheet.
///	@param	{Real}				_frame_start	Frame to start on. Lowerbound. First frame is 0.
///	@param	{Real}				_frame_end		Frame to end at. Upperbound. Do total frames if going for the entire animation.
/// @param	{Real}				_frame_speed	Seconds per frame.
function cutscene_cg_add_scene(_sprite_sheet, _sheet_width, _frame_start, _frame_end, _frame_speed) {
	array_push(cg_array, new cutscene_cg_add(_sprite_sheet, _sheet_width, _frame_start, _frame_end, _frame_speed));
}

/// @description Holds values for functions to run for.
///	@param	{Real}		_frame		Frame to run on in the sheet. Value is clamped by the frame length.
///	@param	{Function}	_function	Function to run.
function cutscene_cg_add_function(_frame, _function) {
	var _cg = array_get(cg_array, array_length(cg_array) - 1);
	
	_frame = clamp(_frame, _cg.frame_start, _cg.frame_end); 
	
	array_push(_cg.function_array, new cutscene_cg_function(_frame, _function));
	
	cg_array[array_length(cg_array) - 1] = _cg;
}

/// @param	{Real}	_index	Index from the array to take from. Defaults to 0.
function cutscene_cg_set_values(_index = 0) {
	
	var _cg = array_get(cg_array, _index);
	
	//var _running_frame_length = _cg.frame_start - _cg.frame_end;
	cutscene_cg_set_frame(_cg.frame_start, _cg.sheet_width);
}
/// @param	{Real}	_index			Index frame to go to.
///	@param	{Real}	_sheet_width	Frames along the X axis of the sprite sheet.
function cutscene_cg_set_frame(_index, _sheet_width) {
	
	x_frame = floor(_index % _sheet_width);
	y_frame = floor((_index - x_frame) / _sheet_width);
	current_frame = (_sheet_width * y_frame) + x_frame;
	
	if (current_frame != _index) {
		current_frame = _index;
		show_debug_message("[obj_cutscene_cg_manager]: <current_frame> was not set properly, hard set to desired index: " + string(_index));
	}
}

#region PAUSE CUTSCENE
///	@param	{Function}	_function	Function to break out of pause.
function cutscene_cg_pause(_function) {
	obj_cutscene_cg_manager.is_paused = true;
	_function();
}
function cutscene_cg_unpause() {
	obj_cutscene_cg_manager.is_paused = false;
}
#endregion

#region LOOP CUTSCENE
///	@param	{Function}	_function		Function to break out of loop.
///	@param	{Real}		[_loop_start]	Frame to start on. Lowerbound. Exclude for the start of the animation.
///	@param	{Real}		[_loop_end]		Frame to end at. Upperbound. Exclude for the end of the animation.
function cutscene_cg_loop(_function) {
	with (obj_cutscene_cg_manager) {
		is_looping = true;
		var _cg = array_get(cg_array, current_scene_of_array);
		var _loop_start = argument_count > 1 ? clamp(argument[1], _cg.frame_start, _cg.frame_end) : _cg.frame_start;
		var _loop_end = argument_count > 2 ? clamp(argument[2], _cg.frame_start, _cg.frame_end) : _cg.frame_end;
		looping_start = _loop_start;
		looping_end = _loop_end;
	}
	_function();
}
function cutscene_cg_unloop() {
	obj_cutscene_cg_manager.is_looping = false;
	looping_start = 0;
	looping_end = 0;
}
#endregion