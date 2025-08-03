if (is_starting_game && !instance_exists(obj_warp_anim)) {
	if (logo_alpha >= 0.1) {
		start_new_game();
		//obj_camera.setup = true;
	}
	
	if (instance_exists(obj_player)) {
		with (obj_player) {
			y++;
			if (instance_exists(obj_warp_anim)) {
				instance_destroy(obj_player);
				//obj_camera.setup = true;
			} else if (obj_player.y >= CAMERA_HEIGHT + obj_player.sprite_height) {
				instance_destroy(obj_player);
				//obj_camera.setup = true;
			}
		}
	}
}



get_controls();

if (
	!instance_exists(obj_warp_anim) &&
	!is_starting_game
	) {
	// option Select
	//option_pos += keyboard_check_pressed(DOWN) - keyboard_check_pressed(UP);
	//accept_key = keyboard_check_pressed(CONFIRM);
	//cancel_key = keyboard_check_pressed(CANCEL);
	
	option_pos += down_key_pressed - up_key_pressed;
	accept_key = confirm_key_pressed;
	cancel_key = cancel_key_pressed;
} else {
	// So no inputs can be made if switching to the game.
	option_pos += 0;
	accept_key = false;
	cancel_key = false;
}
option_number = array_length(option);

if (option_number <= 2) {
	option_pos = clamp(option_pos, 0, option_number - 1);
} else {
	if (option_pos < 0) option_pos = option_number - 1;
	if (option_pos > option_number - 1) option_pos = 0;
}


if (accept_key) {
	switch (option[option_pos]) {
		#region PLAY (NEW GAME)
		case "PLAY":
			if (!is_starting_game) {
				is_starting_game = true;
			}
		break;
		#endregion
		
		
				
		#region QUIT
		case "LEAVE":
			game_end();
		break;
		#endregion
	}
}