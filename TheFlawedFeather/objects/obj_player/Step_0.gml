
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

if (!global.debug.is_enabled) {
	
	#region Outfit Swapping
	// Im gonna remove these later on but this is mainly for testing
	// the sprites.
	var _select_char = keyboard_check_pressed(ord("E")) - keyboard_check_pressed(ord("Q"));
	if (_select_char != 0) {
		char_var += _select_char;
		if (char_var < 0) char_var = 3;
		if (char_var > 3) char_var = 0;
	
		global.player.char.val = char_var;
		
	}


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