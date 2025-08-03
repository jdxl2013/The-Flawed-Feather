get_controls();

/*
if (!instance_exists(obj_exit_menu)) || (obj_item_manager.help_me_anim != -1) {
	// (!instance_exists(obj_item_manager)) {
	can_use_menu = true;
//} else if (obj_item_manager.help_me_anim != -1) {
//	can_use_menu = false;
} else {
	can_use_menu = false;
} */
if (
	!instance_exists(obj_textbox) &&
	!instance_exists(obj_exit_menu) &&
	!instance_exists(obj_item_menu) &&
	!instance_exists(obj_documents_menu) &&
	!instance_exists(obj_save_menu)
) {
	controls_locked = false;
} else {
	controls_locked = true;
}
if (controls_locked == false) {
	
	if (help_me_anim == 0) { // prevents interactions when opening or closing the box
		// option Select
		//option_pos += keyboard_check_pressed(DOWN) - keyboard_check_pressed(UP);
		//accept_key = keyboard_check_pressed(CONFIRM);
		option_pos += down_key_pressed - up_key_pressed;
		accept_key = confirm_key_pressed;
	}
	
	// cancel needs to stay out of the above if so its still possible to cancel out of the creation anim
	//cancel_key = keyboard_check_pressed(CANCEL);
	key_cancel = cancel_key_pressed;
}

#region Handle Options In General
option_number = array_length(option);
textbox_height = 0;
for (var i = 0; i < option_number; i++) textbox_height += option_draw_height;
textbox_height += option_draw_y_offset * 2;
#endregion

if (option_number <= 2) {
	option_pos = clamp(option_pos, 0, option_number - 1);
} else {
	if (option_pos < 0) option_pos = option_number - 1;
	if (option_pos > option_number - 1) option_pos = 0;
}


if (accept_key) {
	
	var _current_option = option[option_pos];
	
	switch (_current_option) {
		#region INVENTORY
		case "INVENTORY":
			if (!instance_exists(obj_item_menu)) {
				help_me_anim = 4;
				instance_create_depth(0, 0, depth - 1, obj_item_menu);
			}
		break;
		#endregion
				
		#region DOCUMENTS
		case "DOCUMENTS":
			if (!instance_exists(obj_documents_menu)) {
				help_me_anim = 4;
				instance_create_depth(0, 0, depth - 1, obj_documents_menu);
			}
		break;
		#endregion
				
		#region SETTINGS (not implemented)
		case "SETTINGS":
					
		break;
		#endregion
				
		#region EXIT TO MAIN MENU OR EXIT GAME
		case "EXIT":
			// make this a special kind of textbox question for now its gonna be a teleport to the main menu
			//help_me_anim = 3;
			if (!instance_exists(obj_exit_menu)) {
				help_me_anim = 4;
				//help_me_anim = 2;
					// do = 2; incase you dont want the player to be able to imediately go back to the
					//		pause menu, will have to make sure that stuff like player actions are
					//		paused when the exit screen is up.
				instance_create_depth(0, 0, depth - 1, obj_exit_menu);
			}
		break;
		#endregion
		
		#region DEBUG MENU
		case "[DEBUG]":
			// for now it just enables & disables the debug value.
			global.debug.is_enabled = global.debug.is_enabled ? false : true;
		break;
		#endregion
		
		#region SAVE MENU
		case "SAVE GAME":
			/*
			This will not be possible in the pause menu, this is here for Debug purposes.
			Saves will be given at certain save points, spawning the obj on interaction.
			*/
			if (!instance_exists(obj_save_menu)) {
				help_me_anim = 4;
				instance_create_depth(0, 0, depth - 1, obj_save_menu);
			}
		break;
		#endregion
		
		default: // Do Nothing, this is here incase of a crash.
	}
}
if (key_cancel && !accept_key) {
	//delete_anim = true;
	help_me_anim = 2;
}
