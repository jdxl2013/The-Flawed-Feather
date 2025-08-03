

/// @description Utilize this only in places where arrays of the save files need to be read out.
/// USE THIS IN obj_save_menu
function update_visible_save_slot_data(_slot_number) {
	var _updated_data_array = array_create(0);
	for (var i = 0; i < _slot_number; i++) {
		array_push(_updated_data_array, read_file_info(i));
	}
	return _updated_data_array;
}

#region Data Scripts
/// @description Checks for if a save file exists or not based on the global.save_slot_amount.
/// @return {Bool}
function check_if_save_data_exists() {
	for (var i = 0; i < global.save_slot_amount; i++) {
		var _file_name = "slot" + string(i) + ".txt";
		if (file_exists(_file_name)) {
			return true;
		}
	}
	return false;
}

/// @description Resets all save data and starts the game

function start_new_game() {
	// randomizes the seed when hitting play
	// be sure to have the seed become determined on each save
	randomize();
			
	reset_all_global_save_data();
	
	//room_goto_next();
	if (global.started_game == false) {
		global.started_game = true;
				
	} else {
		//warp_player(global.player.pos.room,
		//		global.player.pos.x,
		//		global.player.pos.y, 
		//		global.player.pos.dir);
	}
	warp_player(rm_testing1, 504, 448, 0, false, "LOAD_GAME");
	//warp_player(rm_demo_busstop, 256, 368, 1, false, "LOAD_GAME");
}

#endregion