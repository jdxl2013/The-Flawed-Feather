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
		items : array_create(0),
		docs : array_create(0),
	}
	
	// FOR DEMO
	item_add(global.item_list.flute);
}

function setup_global_room_data() {
	global.room_data = 0;
	global.room_data = {
		//Testing Rooms
		tester_1 : 0,
		tester_2 : 1,
		
		// Demo Rooms
		demo_busstop : 2,
		demo_mainroad : 3,
		demo_cafehere : 4,
		demo_road2 : 5,
		demo_alleyway : 6,
		demo_housinghall : 7,
		demo_room209 : 8,
		demo_housingroof : 9,
		demo_schoolgate : 10,
		demo_school1 : 11,
		demo_school2 : 12,
		demo_schoolfield : 13,
	}
}

function setup_global_player_data() {
	global.player = {
		char : {
			val : PLAYER_COSTEL1,
			name : "Costel",
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