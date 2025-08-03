
#region Controls
get_controls();

if (!instance_exists(obj_exit_menu)) {
	controls_locked = false;
} else {
	controls_locked = true;
}
if (controls_locked == false) {
	
	if (help_me_anim == 0) { // prevents interactions when opening or closing the box
		option_pos += down_key_pressed - up_key_pressed; // Scroll Through Documents
		accept_key = confirm_key_pressed; // To Toggle For Ordering The Scroll
		
	}
	// cancel needs to stay out of the above if so its still possible to cancel out of the creation anim
	key_cancel = cancel_key_pressed;
}
#endregion

//option_number = array_length(option[menu_level]);
option_number = array_length(global.inventory.docs);

#region TEXTBOX DOCUMENT STUFFS
if (help_me_anim == 0 && array_length(global.inventory.docs) > 0 && option_pos >= 0 && option_pos < array_length(global.inventory.docs)) {
	//for (var i = 0; i < array_length(global.inventory.docs); i++) {
	//	option[i] = global.inventory.docs[i].name;
	//}
	
	// Handle The Text Box
	if (!instance_exists(obj_textbox)) {
		create_textbox(global.inventory.docs[option_pos].text_id);
		document_change = false;
		if (global.inventory.docs[option_pos].read_status == 0) {
			global.inventory.docs[option_pos].read_status = 1;
		}
	} else {
		// Check For Deletion
		if (obj_textbox.text_id != global.inventory.docs[option_pos].text_id) {
			if (obj_textbox.delete_anim == false && obj_textbox.create_anim == false)
				obj_textbox.delete_anim = true;
				document_change = true;
		} else {
			// Check If Read
			if (global.inventory.docs[option_pos].read_status != 2) {
				if (obj_textbox.page == obj_textbox.page_number - 1) {
					global.inventory.docs[option_pos].read_status = 2;
				}
			}
		}
	}
}
#endregion

// Item Select
if (option_number <= 2) {
	option_pos = clamp(option_pos, 0, option_number - 1);
} else {
	if (option_pos < 0) option_pos = option_number - 1;
	if (option_pos > option_number - 1) option_pos = 0;
}


if (key_cancel) {
	//delete_anim = true;
	help_me_anim = 2;
	
	if (instance_exists(obj_textbox)) {
		obj_textbox.create_anim = false;
		obj_textbox.delete_anim = true;
	}
	
	if (instance_exists(obj_game_menu)) {
		obj_game_menu.help_me_anim = 5;
	}
	//help_me_anim = 2;
}