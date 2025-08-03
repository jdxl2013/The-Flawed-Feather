
#region Controls
get_controls();

if (!instance_exists(obj_exit_menu) && !instance_exists(obj_permission_menu)) {
	controls_locked = false;
} else {
	controls_locked = true;
}

if (controls_locked == false) {
	
	if (help_me_anim == 0) { // prevents interactions when opening or closing the box
		if (slot_was_selected) {
			option_pos += down_key_pressed - up_key_pressed; // Scroll Through Normal Options
		} else {
			selected_slot += down_key_pressed - up_key_pressed; // Scroll Through Save Slots
		}
		accept_key = confirm_key_pressed; // To Toggle For Ordering The Scroll
		
	}
	// cancel needs to stay out of the above if so its still possible to cancel out of the creation anim
	key_cancel = cancel_key_pressed;
}
#endregion

option_number = array_length(option);

#region Save Slot Select
if (slot_number <= 2) {
	selected_slot = clamp(slot_number, 0, slot_number - 1);
} else {
	if (selected_slot < 0) selected_slot = slot_number - 1;
	if (selected_slot > slot_number - 1) selected_slot = 0;
}
#endregion
#region Menu Select
if (option_number <= 2) {
	option_pos = clamp(option_pos, 0, option_number - 1);
} else {
	if (option_pos < 0) option_pos = option_number - 1;
	if (option_pos > option_number - 1) option_pos = 0;
}
#endregion


if (accept_key) {
	accept_key = false;
	
	if (!slot_was_selected) {
		slot_was_selected = true;
		option_pos = 0;
	} else {
		save_slot_data = update_visible_save_slot_data(slot_number);
		
		var _current_option = option[option_pos];
		
		switch (_current_option) {
			#region SAVE FILE
			case "SAVE":
				if (!is_struct(save_slot_data[selected_slot])) {
					save_game_slot(selected_slot);
				} else {
					// Ask to override save file.
					scr_ask_for_action(
						function() {
							with (obj_save_menu) {
								save_game_slot(selected_slot);
								save_slot_data = update_visible_save_slot_data(slot_number);
							}
						},
						"<<WARNING>>\n" +
						"You are trying to save over a pre-existing save slot.\n" +
						"OVERRIDE SAVE SLOT " + string(selected_slot) + "?"
					);
				}
			break;
			#endregion
			
			#region LOAD FILE / NEW GAME
			case "LOAD":
				if (is_struct(save_slot_data[selected_slot])) {
					
					if (instance_exists(obj_game_menu)) {
						obj_game_menu.help_me_anim = 2;
					}
					help_me_anim = 3;
				} else if (room == rm_title_screen) {
					/*	Can only start a new save file if on the main menu,
						running into issues with trying to load the room with a new save but you're already in the same room.
						Avoidable by just removing the save file in the starting room but eh lol. Leave it like this for now.
					*/
					// Ask to play a new game. (Doesn't create a new save file, it just starts you over.)
					scr_ask_for_action(
						function() {
							with (obj_save_menu) {
								if (instance_exists(obj_game_menu)) {
									obj_game_menu.help_me_anim = 2;
								}
								help_me_anim = 3;
							}
						},
						"*Empty Save Slot*\n" +
						"The selected save slot has no loaded data.\n" +
						"Would you like to start a new game?",
						"PLAY NEW GAME", "CANCEL"
					);
				}
			break;
			#endregion
			
			#region COPY
			case "COPY":
				if (is_struct(save_slot_data[selected_slot])) {
					// Needs its own mode to then select where it should copy it over.
				}
			break;
			#endregion
				
			#region DELETE FILE
			case "DELETE":
				if (is_struct(save_slot_data[selected_slot])) {
					scr_ask_for_action(
						function() {
							with (obj_save_menu) {
								delete_game_slot(selected_slot);
								save_slot_data = update_visible_save_slot_data(slot_number);
							}
						},
						"<<WARNING>>\n" +
						"You are about to delete a save file slot.\n" +
						"DELETE SAVE SLOT " + string(selected_slot) + "?"
					);
					
				}
			break;
			#endregion
				
			#region OPEN FILE LOCATION
			case "FILE LOCATION":
				//get_open_filename("save|*.save", "");
				//get_open_filename(game_save_id, "");
				// idk which one
				//url_open("file://" + working_directory);
				//url_open("https://jdxl2013.itch.io/outpatient");
				//url_open(working_directory);
				//get_open_filename(working_directory, "");
				
				//var _file_name = "slot" + string(selected_slot) + ".txt";
				
				get_open_filename_ext(".txt", "", working_directory, "Outpatient");
				
			break;
			#endregion
		
			#region BACK OUT / DESELECT FILE
			case "BACK":
				slot_was_selected = false;
			break;
			#endregion
		
			default: // Do Nothing, this is here incase of a crash.
		}
	}
	#region Updates View
	/*	Updates all of the save slot information to select from.
		Placed here in case if a slot is removed, saved over, etc.
		save_slot_data = update_visible_save_slot_data(slot_number);
	*/
	save_slot_data = update_visible_save_slot_data(slot_number);
	#endregion
}

if (key_cancel) {
	if (slot_was_selected) {
		slot_was_selected = false;
	} else {
		help_me_anim = 2;
		
		if (instance_exists(obj_game_menu)) {
			obj_game_menu.help_me_anim = 5;
		}
	}
}