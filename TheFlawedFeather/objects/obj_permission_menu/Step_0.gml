get_controls();

if (help_me_anim == 0) { // prevents interactions when opening or closing the box
	// option Select
	//option_pos += keyboard_check_pressed(DOWN) - keyboard_check_pressed(UP);
	//accept_key = keyboard_check_pressed(CONFIRM);
	//cancel_key = keyboard_check_pressed(CANCEL);
	option_pos += down_key_pressed - up_key_pressed;
	accept_key = confirm_key_pressed;
	cancel_key = cancel_key_pressed;
}

option_number = array_length(option);

if (option_number <= 2) {
	option_pos = clamp(option_pos, 0, option_number - 1);
} else {
	if (option_pos < 0) option_pos = option_number - 1;
	if (option_pos > option_number - 1) option_pos = 0;
}


if (help_me_anim == 0) {
	if (accept_key) {
	
		switch (option_pos) {
			#region DENY ACTION
			case 0:
				help_me_anim = 2;
			break;
			#endregion
				
			#region CONFIRM ACTION
			case 1:
				if (is_method(optionAction) && help_me_anim == 0) {
					optionAction();
					help_me_anim = 2;
				}
			break;
			#endregion
		}
	}


	if (cancel_key) {
		help_me_anim = 2;
	}
}
