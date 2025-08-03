/// @param _id
/// @description Holds all of the interaction functions used. Check obj_interaction.
/// These run when first interacting with an object.
/// Can either run before all of the preset code or act as a new code interaction altogether.
/// Needs to be a Switch Function due to saving functions in save files not being possible.
function scr_interact_functions(_id) {
	switch (_id) {
		
		#region test_interact_function
		case "test_interact_function":
			scr_warp_functions("test_warp_function");
			break;
		#endregion
		
		#region demo_first_save
		case "demo_first_save":
			if (!check_if_save_data_exists()) {
				setup_interaction_follow(self);
				create_textbox("save_menu_flavor_text");
			} else {
				scr_save_menu();
			}
			break;
		#endregion
		#region demo_save_no_turning_back
		case "demo_save_no_turning_back":
			if (!global.flag[3]) {
				global.flag[3] = true;
				setup_interaction_follow(self);
				create_textbox("demo_save_no_turning_back");
			} else {
				scr_save_menu();
			}
			break;
		#endregion
		
		#region flag_for_gate_key
		case "flag_for_gate_key":
			global.flag[0] = true;
			break;
		#endregion
		#region gate_key_needed
		case "gate_key_needed":
			
			if (
				global.flag[0] ||
				(command != "warp" && check_if_player_has_item(global.item_list.gate_key))
			) {
				//setup_interaction_follow(self);
				create_textbox("school_gate_unlocked");
				command = "warp";
			}
			break;
		#endregion
		#region demo_handle_keyroom_roof_skip_warp
		case "demo_handle_keyroom_roof_skip_warp":
			if (check_if_player_has_item(global.item_list.gate_key)) {
				target_room = rm_demo_housinghall;
				target_x = 488;
				target_y = 160;
				target_dir = 0;
			} else {
				target_room = rm_demo_room209;
				target_x = 256;
				target_y = 144;
				target_dir = -1;
			}
			break;
		#endregion
	
		default: // Do nothing.
	}
}