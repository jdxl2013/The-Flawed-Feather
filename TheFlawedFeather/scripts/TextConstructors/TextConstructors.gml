#region Main Page Constructor
/// This constructor holds all values utilized for each textbox page.
/// Values are private to then handle while creating a textbox.
/// If a value is not set (excluding commands or options), then the prior page's values are used.
/// This is utilized instead of several parallel arrays created within the creation event of obj_textbox.
function textbox_create_page() constructor {
	
	override_with_preset = false; // Used for stuff like Cinematic Stuff.
	
	transition_animation = false; // Transition between different states of textboxes.
	
	values = {
		player_can_skip : false,
		self_auto_skip : false, // Page itself autoskips to the next page when finished with the text.	
	}
	
	box = {
		pos : { x : 0, y : 0},
		offset : { x : 0, y : 0}, // Offset added onto box.pos
		
		image : spr_textbox,
		spd : 0,
		index : 0,
		
		width : 0,
		height : 0,
		
	}
	name = {
		text : "",
		color : c_outp_orange,
		text_alpha : 1,
		box_alpha : 1,
		pos : { x : 0, y : 0},
	}
	
	// Doesn't get inherited.
	text = array_create(0, new textbox_create_text_data(""));
	
	portraits = array_create(0, new textbox_create_portrait_data(0, 0));
	// Holds each currently shown portrait on screen.
	// Actual images are handled privately in the constructor with use of textbox_create_portrait_img_data().
	
	typer = {
		spd : 1,
		sounds : array_create(0, new textbox_create_typer_data(snd_voice_default, 0, 0, 0)),
	}
	// Doesn't get inherited.
	options = {
		pos : { x : 0, y : 0},
		align : fa_left,
		option : array_create(0, {
			text : "",
			color : c_white,
			text_alpha : 1,
			box_alpha : 1,
			code_to_run : 0, //Function
		}),
	}
	
	// Doesn't get inherited.
	scripts = {
		start_page : 0,
		end_page : 0,
		drawn_text :  array_create(0, {
			funct : 0,
			index : 0,
			has_ran_funct : false,
		}),
	}
}

#endregion

#region Text Constructor
/// This is here if you want several texts to be drawn out all at once.
/// This is considered finished after all texts in the array are completed.
function textbox_create_text_data(_text, _col = c_white, _alpha = 1, _x = 0, _y = 0) constructor {
	text = _text;
	color = _col;
	alpha = _alpha;
	pos = { x : _x, y : _y};
		
	current_char = 0; // DO NOT ALTER
	// Handles the drawn character of it.
}
#endregion

#region Portrait Constructor
function textbox_create_portrait_data(_x, _y, _col = c_black, _alpha = 1) constructor {
	pos = { x : _x, y : _y};
	bg_color = _col;
	bg_alpha = _alpha;
	img_array = array_create(0, new textbox_create_portrait_img_data(spr_portrait_costelA, 0, 0));
}
#endregion

#region Portrait Image Layering Constructor
/// @param	{Asset.GMSprite}	_sprite_sheet		Character portrait sprite sheet.
/// @param	{Real}				_x_frame			X frame of sheet. Starts at 0.
/// @param	{Real}				_y_frame			Y frame of sheet. Starts at 0.
/// @param	{Constant.color}	[_col]			Color for the bg frame.
/// @param	{Real}				[_alpha]			Alpha for the frame. Between 0 & 1.
function textbox_create_portrait_img_data(_sprite_sheet, _x_frame, _y_frame, _col = c_white, _alpha = 1) constructor {
	sprite_sheet = _sprite_sheet;
	frame = { x : _x_frame, y : _y_frame};
	col = _col;
	alpha = _alpha;
}

#endregion

#region Sound Constructor
/// @param			_snd			Sound bite. Plays per each typed char.
/// @param	{Real}	[_pitch]		Pitch multiplier. 1 is default.
/// @param	{Real}	[_variance]		Pitch variance. Added RNG onto multiplier for each typed char. 0 for no RNG.
/// @param	{Real}	[_loudness]		Sound loudness multiplier.
function textbox_create_typer_data(_snd, _pitch = 1, _variance = 0, _loudness = 0.5) constructor {
	sound = _snd;
	pitch = _pitch;
	variance = _variance;
	loudness = _loudness;
}
#endregion