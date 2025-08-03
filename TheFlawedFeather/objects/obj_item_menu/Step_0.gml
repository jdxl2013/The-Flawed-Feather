
#region Controls
get_controls();

if (!instance_exists(obj_exit_menu) && !instance_exists(obj_textbox)) {
	controls_locked = false;
} else {
	controls_locked = true;
}
if (controls_locked == false) {
	
	if (help_me_anim == 0) { // prevents interactions when opening or closing the box

		// option Select
		//option_pos += keyboard_check_pressed(RIGHT) - keyboard_check_pressed(LEFT); // Item Scroll
		//main_option_pos += keyboard_check_pressed(DOWN) - keyboard_check_pressed(UP); // Item Options
		//accept_key = keyboard_check_pressed(CONFIRM);
		option_pos += right_key_pressed - left_key_pressed; // Item Scroll
		main_option_pos += down_key_pressed - up_key_pressed; // Item Options
		accept_key = confirm_key_pressed;
		
		
	}
	// cancel needs to stay out of the above if so its still possible to cancel out of the creation anim
	//cancel_key = keyboard_check_pressed(CANCEL);
	key_cancel = cancel_key_pressed;
}
#endregion

if (right_key_pressed || left_key_pressed || down_key_pressed || up_key_pressed) {
	audio_play_sound(snd_item_sel, 3, false);
}


//option_number = array_length(option[menu_level]);
option_number = array_length(global.inventory.items);
// Item Select
if (option_number <= 2) {
	option_pos = clamp(option_pos, 0, option_number - 1);
} else {
	if (option_pos < 0) option_pos = option_number - 1;
	if (option_pos > option_number - 1) option_pos = 0;
}

// Menu Select
if (main_option_number <= 2) {
	main_option_pos = clamp(main_option_pos, 0, main_option_number - 1);
} else {
	if (main_option_pos < 0) main_option_pos = main_option_number - 1;
	if (main_option_pos > main_option_number - 1) main_option_pos = 0;
}

// Prevent Using The Item
if (instance_exists(obj_textbox)) {
	help_me_anim = 3;
} else {
	if (help_me_anim == 0) {
		help_me_anim = 4;
		if (array_length(global.inventory.items) != 0) {
			if (global.inventory.items[option_pos].effect_action_used == true)
				global.inventory.items[option_pos].effect_action_used = false;	
		}
	}
}


if (accept_key) {
	//var _last_option = option_pos;
	switch (option[main_option_pos]) {
		/*
		USE
		COMBINE (IDK)
		INSPECT (IDK)
		DISCARD (debate on removing for the final game since the inventory is infinite)
				(also with the added fact that this game isnt really an RPG game and way more puzzle based)
		BACK
		*/
		#region USE
		case "USE":
			if (array_length(global.inventory.items) != 0) {
				if (is_string(global.inventory.items[option_pos].effect_id) && 
				global.inventory.items[option_pos].effect_action_used == false) {
					//global.inventory.items[option_pos].effect();
					scr_item_functions(global.inventory.items[option_pos].effect_id);
					
					global.inventory.items[option_pos].effect_action_used = true;
					/*help_me_anim = 2;
					if (instance_exists(obj_game_menu)) {
						obj_game_menu.help_me_anim = 2;
					}*/
					audio_play_sound(snd_item_use, 3, false);
				}
			}
		break;
		#endregion
		
		#region DISCARD ITEM
		case "DISCARD":
			//item_remove(option_pos);
			if (array_length(global.inventory.items) != 0) {
				
				if (option_pos == array_length(global.inventory.items) - 1) {
					option_pos -= 1;
					array_delete(global.inventory.items, option_pos + 1, 1);
					//scroll_buffer_bound = "R";
				} else {
					array_delete(global.inventory.items, option_pos, 1);
				}
			}
		break;
		#endregion
		
		#region CLOSE MENU
		case "BACK":
			help_me_anim = 2;
			if (instance_exists(obj_game_menu)) {
				obj_game_menu.help_me_anim = 5;
			}
		break;
		#endregion
	}
}
if (key_cancel) {
	//delete_anim = true;
	help_me_anim = 2;
	if (instance_exists(obj_game_menu)) {
		obj_game_menu.help_me_anim = 5;
	}
	//help_me_anim = 2;
}