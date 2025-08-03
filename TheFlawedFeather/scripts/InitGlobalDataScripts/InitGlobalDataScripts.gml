/// @description Resets all currently loaded save data.
function reset_all_global_save_data() {
	
	setup_global_player_data();
	setup_global_inventory_data();
	global.timers = array_create(0);
	setup_global_flags();
	setup_global_room_data();
}

function setup_global_inventory_data() {
	global.inventory = {
		docs : array_create(0),
	}
	
	documents_add(global.documents_list.doc_controls);
	documents_add(global.documents_list.doc_how_play);
	documents_add(global.documents_list.doc_credits);
}

function setup_global_room_data() {
	global.room_data = 0;
	global.room_data = {
		//Testing Rooms
		tester_1 : 0,
		tester_2 : 1,
		
		
	}
}

function setup_global_player_data() {
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
}