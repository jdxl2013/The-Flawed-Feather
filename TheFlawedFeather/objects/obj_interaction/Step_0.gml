
get_controls();

#region HANDLE FLAWS
if (has_flaw == true) {
	if (!has_setup_flaw) {
		has_setup_flaw = true;
	
		if (array_length(possible_flaws) != 0) {
			possible_flaws[irandom(array_length(possible_flaws))]();
		}
	
	}
}
#endregion


#region HANDLE INTERACTIONS

if (interaction_is_available == true) {
	//var _list = ds_list_create();
	//var _num = collision_circle_list(x, y, radius, obj_player, false, true, _list, true);

	var _facing_buffer = 4;

	// Is facing interactable
	//if (_num == 1) {
	
	can_interact = false;
	if (
		!instance_exists(obj_warp_anim) &&
		!instance_exists(obj_textbox) &&
		global.player.can_move
	) {
		if (
			obj_mouse.hovering &&
			collision_point(obj_mouse.x, obj_mouse.y, self, false, false)
		) {
			can_interact = true;
		}
	}
	
	
	if (can_interact == true) {
	
		//if keyboard_check_pressed(CONFIRM) && !instance_exists(obj_textbox) {
		if confirm_key_pressed {
			
			scr_interact_functions(interaction_script_id);
			
			marked_for_flaw = marked_for_flaw ? false : true;
			
			// What to do on interaction.
			if (command != 0) {
				switch (command) {
					#region TEXTBOXES
					case "text":
						setup_interaction_follow(self);
						
						if (interaction_type == 2) {
							// Randomize action.
							/*	Keep this before creating the textbox so it randomizes
								on the first interaction instead of every 2nd interaction otherwise.
							*/
							current_interaction = irandom_range(1, interaction_amt);
						}
						
						var _base_id = text_id;
						if (interaction_amt > 1) text_id = text_id + string(current_interaction);
						create_textbox(text_id);
						text_id = _base_id;
						
						current_interaction++;
						if (interaction_type == 1) { // Hold on last action.
							current_interaction = clamp(current_interaction, 1, interaction_amt);
						} else if (interaction_type == 3) { // End after finishing the interaction.
							if (current_interaction > interaction_amt) {
								interaction_is_available = false;
							}
						} else { // Loop Interaction
							if (current_interaction > interaction_amt) {
								current_interaction = 1;
							}
						}
							
					break;
					#endregion
				
					#region DOORS / INTERACTABLE WARP
					case "warp":
						warp_player(target_room, target_x, target_y, target_dir, instant_warp, warp_script_ids);
						// In the case that i add in an extra sprite for opening doors.
						// honestly debate on tweening it or not (condencing the sprite)
						// stick to this for now
						//image_index++;
					break;
					#endregion
				
					default: // Do Nothing
				}
			} 
		
			can_interact = false;
		}
	}

} else {
	can_interact = false;	
}

#endregion
