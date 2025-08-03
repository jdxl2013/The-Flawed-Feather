


/// @description				Draws an image of a sprite sheet for character portraits. Portraits must be 32x32.
/// param	{Real}				_x					Top left X position.
/// param	{Real}				_y					Top left Y position.
/// param	{Constant.color}	_bg_color			Color for the bg frame.
/// param	{Real}				_bg_alpha			Alpha for the frame. Between 0 & 1.
/// param	{Real}				_portrait_alpha		Alpha for the portrait. Between 0 & 1.
/// param	{...: Any*}			...					All inserted values (portrait constructs) from here after are layered over each other.
///													Used to overlayer parts of different images. Usually for mouth & eye variation or clothing.
function draw_character_portrait2(_x, _y, _bg_color, _bg_alpha, _portrait_alpha) {

}

/// @description				Draws an image of a sprite sheet for character portraits. Portraits must be 32x32.
/// @param	{Real}				_x					Top left X position.
/// @param	{Real}				_y					Top left Y position.
/// @param	{Asset.GMSprite}	_sprite_sheet		Character portrait sprite sheet.
///	@param	{Real}				_x_frame			X frame of sheet. Starts at 0.
///	@param	{Real}				_y_frame			Y frame of sheet. Starts at 0.
/// @param	{Constant.color}	_bg_color			Color for the bg frame.
/// @param	{Real}				_bg_alpha			Alpha for the frame. Between 0 & 1.
/// @param	{Real}				_portrait_alpha		Alpha for the portrait. Between 0 & 1.
function draw_character_portrait(_x, _y, _sprite_sheet, _x_frame, _y_frame, _bg_color = c_black, _bg_alpha = 1, _portrait_alpha = 1) {
	
	/*
	if (argument_count < 5) exit;
	
	var _portrait_array = array_create(0);
	for (var i = 5; i < argument_count; i++) {
		array_push(_portrait_array, argument[i]);
	}*/
	
	var _box_spr = spr_textbox;
	var _box_img = 0;
	var _box_spd = 0;
	var _box_spr_width = sprite_get_width(_box_spr);
	var _box_spr_height = sprite_get_height(_box_spr);
	
	var _box_size = 43;
	var _portrait_size = 32;
	
	// Image Box
	draw_sprite_ext(
		_box_spr, _box_img,
		_x, _y,
		_box_size / _box_spr_width,
		_box_size / _box_spr_height,
		0, _bg_color, _bg_alpha);
	// Actual Image
	draw_sprite_part_ext(
		_sprite_sheet, 0,
		_x_frame * _portrait_size, _y_frame * _portrait_size,
		_portrait_size, _portrait_size,
		_x + ((_box_size - _portrait_size) / 2), _y + ((_box_size - _portrait_size) / 2),
		1, 1,
		c_white, _portrait_alpha);
	
	/*
	for (var i = 0; i < array_length(_portrait_array); i++) {
		var _img = _portrait_array[i];
		
		draw_sprite_part_ext(
			_img.sprite_sheet, 0,
			_img.x_frame * _portrait_size, _img.y_frame * _portrait_size,
			_portrait_size, _portrait_size,
			_x + ((_box_size - _portrait_size) / 2), _y + ((_box_size - _portrait_size) / 2),
			1, 1,
			_img.col, _img.alpha * _portrait_alpha);
	}*/
}


function textbox_typer_play_sounds(_snd, _pitch = 1, _variance = 0, _loudness = 0.8) {
	var _pitch_rng = irandom(1);
	if (_pitch_rng == 0) _pitch_rng = -1;
	
	audio_play_sound(_snd, 5, false, _loudness, 0, _pitch + (_variance * _pitch_rng));
}