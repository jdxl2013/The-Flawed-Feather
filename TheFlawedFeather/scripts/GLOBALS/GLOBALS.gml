
#region Game Variables
global.player = {
	char : {
		val : PLAYER_COSTEL1,
		name : "COSTEL",
	},
	pos : {
		room : 0,
		room_name : 0, // For Saving
		x : 0,
		y : 0,
		dir : 0,	
	},
	
	can_move : true,
	can_look : true,
}
global.inventory = {
	items : [],
	docs : [],
}
#endregion

#region Fun Value Stuff

global.fun_value = {
	main : irandom(99), // Decided on save file creation.
	sub : irandom(9) // Changes on room change (idk)
}
// Changes through out the game, caps off at 99.
global.lucidity_value = 0;
#endregion

#region Settings
global.doc_menu = {
	order : 0,
	scend : 0
}

global.settings = {
	textbox : {
		animations : true,
		auto_skip : true,
	}
}

global.debug = {
	is_enabled : false,
	cam : {
		is_free : false,
		can_move : false,
	},
}
global.save_slot_amount = 9; // Making it a debug setting for players. Keep out of debug struct.
#endregion

#region Save Values
global.started_game = false; // Handles if it jumps straight to the gameplay or if it goes to the save files when starting.

global.save_time_data = {
	// Time Last Saved
	last_played : 0,
	// Save File Time
	playtime : 0,
}
#endregion