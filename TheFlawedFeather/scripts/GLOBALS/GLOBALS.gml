
#region Game Variables
global.player = {
	char : {
		val : PLAYER_INTR,
		gender : irandom(1),
		main_side_right : irandom(1),
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
	docs : [],
}
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
#endregion

#region Save Values
global.started_game = false; // Handles if it jumps straight to the gameplay or if it goes to the save files when starting.

#endregion