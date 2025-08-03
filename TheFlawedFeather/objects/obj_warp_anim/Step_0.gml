
if (instant_warp) {
	#region Instant Warp
	warp_player(target_room, target_x, target_y, target_dir, instant_warp, warp_script_ids);
	
	#region Handle Warp Scripts
	if (is_array(warp_script_ids)) {
		for (var i = 0; i < 3; i++) {
			scr_warp_functions(warp_script_ids[i]);
		}
	} else {
		scr_warp_functions(warp_script_ids);
	}
	#endregion
	
	instance_destroy();
	#endregion
} else {
	#region Handle Warp
	if (target_room = rm_title_screen || room = rm_title_screen) {
		fade_spd = 0.05;
	}

	if (!has_warped) {//(room != target_room) {
		if (image_alpha == 1) {
			
			#region Handle Start Script
			if (is_array(warp_script_ids)) {
				if (array_length(warp_script_ids) > 0) {
					scr_warp_functions(warp_script_ids[0]);
				}
			}
			#endregion
		}
		
		if (image_alpha < 1)
		&& (!instance_exists(obj_textbox))
		&& (!instance_exists(obj_game_menu))
			image_alpha += fade_spd;
	
		if (image_alpha >= 1) {
			if (pause_timer == 0)
				pause_timer = pause_time;	
			else {
				pause_timer--;
				if (pause_timer <= 0) {
					// Perform Room Transition
					warp_player(target_room, target_x, target_y, target_dir, instant_warp, warp_script_ids);
					
					#region Handle Warp Script
					if (is_array(warp_script_ids)) {
						if (array_length(warp_script_ids) > 1) {
							scr_warp_functions(warp_script_ids[1]);
						}
					} else {
						scr_warp_functions(warp_script_ids);
					}
					#endregion
					
					has_warped = true;
				}
			}
		}
	} else if (pause_timer <= 0) {
		if (image_alpha > 0) image_alpha -= fade_spd;
		if (image_alpha <= 0) {
			// End Animation
			
			#region Handle End Anim Script
			if (is_array(warp_script_ids)) {
				if (array_length(warp_script_ids) > 2) {
					scr_warp_functions(warp_script_ids[2]);
				}
			}
			#endregion
			
			instance_destroy();
		}
	}
	#endregion
}