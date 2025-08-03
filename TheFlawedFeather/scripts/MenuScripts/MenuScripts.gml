function scr_save_menu() {
	if (!instance_exists(obj_save_menu)) {
		instance_create_depth(0, 0, -99999, obj_save_menu);
	}
}


function scr_pause_menu() {
	if (room != rm_init || room != rm_title_screen)
			&& (!instance_exists(obj_textbox)) 
			&& (!instance_exists(obj_warp_anim)) {
		
		if (!instance_exists(obj_game_menu)) {
			instance_create_layer(0, 0, "Camera", obj_game_menu);
		} else {
			//obj_game_menu.create_anim = true;
			obj_game_menu.help_me_anim = 0;
		}
	}
}

/// @desc Creates obj_permission_menu to then run a script to make sure if the player wants to do an important action.
/// @desc Ex.: Saving over a pre-existing save file or deleting a save file.
/// @param {Function} _confirm_action Function to run if you choose to confirm.
/// @param {String} [_info_text] Description for what action will be performed.
/// @param {String} [_confirm_text] Confirm text.
/// @param {String} [_deny_text] Deny text.
function scr_ask_for_action(_confirm_action, _info_text = "", _confirm_text = "CONFIRM", _deny_text = "DENY"){
	
	if (!instance_exists(obj_permission_menu)) {
		with (instance_create_depth(x, y, depth - 1, obj_permission_menu)) {
			optionAction = _confirm_action;
			info_text = _info_text;
			option[0] = _deny_text;
			option[1] = _confirm_text;
		}
	}
}