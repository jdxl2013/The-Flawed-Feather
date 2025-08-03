
get_controls();
key_left = left_key; //keyboard_check(LEFT);
key_right = right_key; //keyboard_check(RIGHT);
key_run = running_key; //keyboard_check(CANCEL);

if (room == rm_title_screen && instance_exists(obj_player)) {
	//instance_destroy(obj_player);
	//obj_camera.setup = true;
}

//if (keyboard_check_pressed(MENU)) {
if (menu_key_pressed && room != rm_title_screen) {
	scr_pause_menu();
}

if (global.debug.is_enabled) {
	
	#region Outfit Swapping
	// Im gonna remove these later on but this is mainly for testing
	// the sprites.
	var _select_char = keyboard_check_pressed(ord("E")) - keyboard_check_pressed(ord("Q"));
	if (_select_char != 0) {
		char_var += _select_char;
		if (char_var < 0) char_var = 4;
		if (char_var > 4) char_var = 0;
	
		global.player.char.val = char_var;
		/*
		var _char = 0;
		if (char_var == 0) _char = PLAYER_COSTEL1;
		if (char_var == 1) _char = PLAYER_COSTEL2;
		if (char_var == 2) _char = PLAYER_RIANNE1;
		if (char_var == 3) _char = PLAYER_RIANNE2;
		if (char_var == 4) _char = PLAYER_RIANNE3;
		*/
	}
	handle_character(char_var);


	#endregion


	#region Toggle Eyeglow
	// (mainly for Rianne)
	if (keyboard_check_pressed(ord("A")) and char_eye_alpha == 0) char_eye_alpha = 1;
	else if (keyboard_check_pressed(ord("A")) and char_eye_alpha == 1) char_eye_alpha = 0;
	#endregion
	#region Darken Sprite
	// (darken sprite for more defined Eye glow, especially for Costel)
	if (keyboard_check_pressed(ord("S")) and char_brightness == c_white) char_brightness = c_gray;
	else if (keyboard_check_pressed(ord("S")) and char_brightness == c_gray) char_brightness = c_white;

	#endregion
	#region Toggle Bandana
	// (appears only if its Rianne, nvm i can do it in the char enum
	if (keyboard_check_pressed(ord("D")) and char_bandana_alpha == 0) char_bandana_alpha = 1;
	else if (keyboard_check_pressed(ord("D")) and char_bandana_alpha == 1) char_bandana_alpha = 0;
	#endregion
}

handle_character(char_var);

// Prevents Subpixel Movement
if (image_xscale > 0) x = floor(x);
else x = ceil(x);
y = floor(y);

switch (state) {
	case PLAYERSTATE.FREE: playerstate_free(); break;
}