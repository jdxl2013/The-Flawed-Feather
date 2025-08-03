
#region Save / Load Game
/// @param {Real} [_save_slot] <Value to save the slot to.>
function save_game_slot(_save_slot) {
	var _file_name = "slot" + string(_save_slot) + ".txt";
	
	#region Pre-Save Data
	save_playtime();
	save_player_data();
	save_room();
	#endregion
	
	// What data needs to be saved.
	var _save_struct = {
		save_time : global.save_time_data,
		player_data : global.player,
		inventory : global.inventory,
		doc_menu : global.doc_menu,
		room_data : global.room_data,
		flag : global.flag,
		timers : global.timers,
	}
	var _json_str = json_stringify(_save_struct);
	
	var _buffer = buffer_create(string_byte_length(_json_str) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json_str);
	buffer_save(_buffer, _file_name);
	buffer_delete(_buffer);
}

/// @param {Real} [_load_slot] <Value to load the slot.>
function load_game_slot(_load_slot) {
	var _file_name = "slot" + string(_load_slot) + ".txt";
	if (!file_exists(_file_name)) exit;
	
	var _buffer = buffer_load(_file_name);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_struct = json_parse(_json);
		
	#region Load Data
	
	//show_debug_message(string(array_length(global.inventory.items)));
	
	global.save_time_data = _load_struct.save_time;
	global.player = _load_struct.player_data;
	global.inventory = _load_struct.inventory;
	global.doc_menu = _load_struct.doc_menu;
	
	global.room_data = _load_struct.room_data;
	global.flag = _load_struct.flag;
	global.timers = _load_struct.timers;
	
	//show_debug_message(string(array_length(global.inventory.items)));
	#endregion
		
	warp_player(
		global.player.pos.room,
		global.player.pos.x,
		global.player.pos.y,
		global.player.pos.dir,
		false,
		"LOAD_GAME"
	);
}

/// @param {Real} [_save_slot] <Value to load the slot.>
function read_file_info(_save_slot) {
	// Used for file Info.
	
	var _file_name = "slot" + string(_save_slot) + ".txt";
	
	if (file_exists(_file_name)) {
		var _file = file_text_open_read(_file_name);
		var _json = file_text_read_string(_file);
		var _load_struct = json_parse(_json);
		
		#region Load Data
		
		var _read_info = {
			char : _load_struct.player_data.char.name,
			saved_rm : _load_struct.player_data.pos.room,
			save_time : _load_struct.save_time.last_played,
			playtime : _load_struct.save_time.playtime,
		};
		
		#endregion
		
		file_text_close(_file);
		
		return _read_info;
	} else {
		return 0;
	}
}

function delete_game_slot(_save_slot) {
	var _file_name = "slot" + string(_save_slot) + ".txt";
	if (!file_exists(_file_name)) exit;
	else file_delete(_file_name);
}
#endregion

#region Save / Load Room

function save_room() {
	
	#region Save Interactable Objects
	// INIT
	var _room_struct = {
		interacts : {
			amt : 0,
			data : [],
		},
		collide_blocks : {
			amt : 0,
			data : [],
		},
	}
	
	#region Save Interactable Objects
	if (instance_exists(obj_interaction)) {
		with (obj_interaction) {
			if (data_will_save) {
				save_interactable_data();
				array_push(_room_struct.interacts.data, save_data);
			}
		}
	}
	_room_struct.interacts.amt = array_length(_room_struct.interacts.data);
	#endregion
	
	#region Save Collide Block Objects
	if (instance_exists(obj_collide_cmd_block)) {
		with (obj_collide_cmd_block) {
			if (run_function_once) {
				save_collide_block_data();
				array_push(_room_struct.collide_blocks.data, save_data);
			}
		}
	}
	_room_struct.collide_blocks.amt = array_length(_room_struct.collide_blocks.data);
	#endregion

	//show_debug_message("Saved " + string(_room_struct.interacts.amt) + " objects in " + room_get_name(room));
	#endregion
	
	#region Save Room Data
	switch (room) {
		case (rm_testing1): global.room_data.tester_1 = _room_struct; break;
		case (rm_testing2): global.room_data.tester_2 = _room_struct; break
		
		case (rm_demo_busstop): global.room_data.demo_busstop = _room_struct; break;
		case (rm_demo_mainroad): global.room_data.demo_mainroad = _room_struct; break;
		case (rm_demo_cafehere): global.room_data.demo_cafehere = _room_struct; break;
		case (rm_demo_road2): global.room_data.demo_road2 = _room_struct; break;
		case (rm_demo_alleyway): global.room_data.demo_alleyway = _room_struct; break;
		case (rm_demo_housinghall): global.room_data.demo_housinghall = _room_struct; break;
		case (rm_demo_room209): global.room_data.demo_room209 = _room_struct; break;
		case (rm_demo_housingroof): global.room_data.demo_housingroof = _room_struct; break;
		case (rm_demo_schoolgate): global.room_data.demo_schoolgate = _room_struct; break;
		case (rm_demo_school1): global.room_data.demo_school1 = _room_struct; break;
		case (rm_demo_school2): global.room_data.demo_school2 = _room_struct; break;
		case (rm_demo_schoolfield): global.room_data.demo_schoolfield = _room_struct; break;
		default: exit;
	}
	#endregion
}
function load_room() {
	
	//show_debug_message("trying to load data");
	#region Load Room Data
	var _room_struct = 0;
	switch (room) {
		case (rm_testing1): _room_struct = global.room_data.tester_1; break;
		case (rm_testing2): _room_struct = global.room_data.tester_2; break;
		
		case (rm_demo_busstop): _room_struct = global.room_data.demo_busstop; break;
		case (rm_demo_mainroad): _room_struct = global.room_data.demo_mainroad; break;
		case (rm_demo_cafehere): _room_struct = global.room_data.demo_cafehere; break;
		case (rm_demo_road2): _room_struct = global.room_data.demo_road2; break;
		case (rm_demo_alleyway): _room_struct = global.room_data.demo_alleyway; break;
		case (rm_demo_housinghall): _room_struct = global.room_data.demo_housinghall; break;
		case (rm_demo_room209): _room_struct = global.room_data.demo_room209; break;
		case (rm_demo_housingroof): _room_struct = global.room_data.demo_housingroof; break;
		case (rm_demo_schoolgate): _room_struct = global.room_data.demo_schoolgate; break;
		case (rm_demo_school1): _room_struct = global.room_data.demo_school1; break;
		case (rm_demo_school2): _room_struct = global.room_data.demo_school2; break;
		case (rm_demo_schoolfield): _room_struct = global.room_data.demo_schoolfield; break;
		default: exit;
	}
	//show_debug_message("found room data? " + string(is_struct(_room_struct)));
	if (!is_struct(_room_struct)) exit;
	#endregion
	//show_debug_message("loaded data");
	
	#region Load Interactable Objects
	if (instance_exists(obj_interaction)) {
		with (obj_interaction) {
			if (data_will_save) {
				instance_destroy();
				//show_debug_message("Destroyed object in " + room_get_name(room) + " for preload.");
			}
		}
	}
	for (var i = 0; i < _room_struct.interacts.amt; i++) {
		
		var _data = _room_struct.interacts.data[i];
		with (instance_create_layer(_data.x, _data.y, _data.layer, _data.object_index)) {
			save_data = _data;
			load_interactable_data();
			//show_debug_message("Object #" + string(i) + " in " + room_get_name(room) + " was loaded.");
		}
	}
	#endregion
	
	#region Load Collide Block Objects
	if (instance_exists(obj_collide_cmd_block)) {
		with (obj_collide_cmd_block) {
			if (run_function_once) {
				instance_destroy();
				//show_debug_message("Destroyed object in " + room_get_name(room) + " for preload.");
			}
		}
	}
	for (var i = 0; i < _room_struct.collide_blocks.amt; i++) {
		
		var _data = _room_struct.collide_blocks.data[i];
		with (instance_create_layer(_data.x, _data.y, _data.layer, _data.object_index)) {
			save_data = _data;
			load_collide_block_data();
			//show_debug_message("Object #" + string(i) + " in " + room_get_name(room) + " was loaded.");
		}
	}
	#endregion
}

#endregion

#region Save Specific Values
function save_playtime() {
	if (global.started_game) {
		global.save_time_data.playtime = date_second_span(global.save_time_data.last_played, date_current_datetime());
		//global.save_time_data.playtime = date_create_datetime();
	}
	global.save_time_data.last_played = date_current_datetime();
}
function save_player_data() {
	global.player.pos.room = room;
	
	if instance_exists(obj_player) {
		global.player.pos.x = obj_player.x;
		global.player.pos.y = obj_player.y;
		global.player.pos.dir = obj_player.image_xscale;
		
		global.player.char.val = obj_player.char_var;
		global.player.char.name = obj_player.char_name;
	}
}
function save_document_menu_settings(_order, _scend) {
	global.doc_menu.order = _order;
	global.doc_menu.scend = _scend;
}
#endregion

#region Basic Save Load save_data values
function save_basic_data() {
	save_data.x = x;
	save_data.y = y;
	
	save_data.sprite_index = sprite_index;
	save_data.image_index = image_index;
	save_data.image_speed = image_speed;
	
	save_data.image_xscale = image_xscale;
	save_data.image_yscale = image_yscale;
	save_data.image_blend = image_blend;
	save_data.image_angle = image_angle;
	
	save_data.layer = layer;
}
function load_basic_data() {
	x = save_data.x;
	y = save_data.y;
	
	sprite_index = save_data.sprite_index;
	image_index = save_data.image_index;
	image_speed = save_data.image_speed;
	
	image_xscale = save_data.image_xscale;
	image_yscale = save_data.image_yscale;
	image_blend = save_data.image_blend;
	image_angle = save_data.image_angle;
	
	layer = save_data.layer;
}
#endregion

#region Save & Load obj_interaction
/*
There has got to be an easier way of typing out this save & load stuff.
Atleast something where I don't need to update the functions when I want to update the object data.
*/
function save_interactable_data() {
	save_data.data_will_save = data_will_save;
	
	save_basic_data();

	save_data.can_interact = can_interact;
	save_data.interaction_amt = interaction_amt;
	save_data.current_interaction = current_interaction;
	save_data.interaction_is_available = interaction_is_available;
	save_data.interaction_type = interaction_type;

	save_data.command = command;
	save_data.text_id = text_id;
	save_data.target_room = target_room;
	save_data.target_x = target_x;
	save_data.target_y = target_y;
	save_data.target_dir = target_dir;
	
	save_data.interaction_script_id = interaction_script_id;
	save_data.warp_script_ids = warp_script_ids;
	save_data.instant_warp = instant_warp;
	
	save_data.item = item;
}
function load_interactable_data() {
	data_will_save = save_data.data_will_save;
	
	load_basic_data();

	can_interact = save_data.can_interact;
	
	interaction_amt = save_data.interaction_amt;
	//if (data_will_save) { // Basic fix to what is variable or not.
		current_interaction = save_data.current_interaction;
		interaction_is_available = save_data.interaction_is_available;
	//}
	interaction_type = save_data.interaction_type;

	command = save_data.command;
	text_id = save_data.text_id;
	target_room = save_data.target_room;
	target_x = save_data.target_x;
	target_y = save_data.target_y;
	target_dir = save_data.target_dir;
	
	interaction_script_id = save_data.interaction_script_id;
	warp_script_ids = save_data.warp_script_ids;
	instant_warp = save_data.instant_warp;
	
	item = save_data.item;
}
#endregion

#region Save & Load obj_collide_cmd_block
/*
There has got to be an easier way of typing out this save & load stuff.
Atleast something where I don't need to update the functions when I want to update the object data.
*/
function save_collide_block_data() {
	save_data.run_function_once = run_function_once;
	save_data.command_id = command_id;
	
	save_basic_data();
}
function load_collide_block_data() {
	run_function_once = save_data.run_function_once;
	command_id = save_data.command_id;
	
	load_basic_data();
}
#endregion

#region Load Specific Values

#endregion