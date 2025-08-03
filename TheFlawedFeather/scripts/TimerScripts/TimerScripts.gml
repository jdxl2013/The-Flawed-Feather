
global.timers = array_create(0);

/// Constructor
/// @param {String} _id Function ID name. Check scr_timer_functions().
/// @param {Real} _timer Timer amount.
/// @param {String} _persist_type Persistence type. Handles then the timer counts down. Check timer_type_booleans().
/// @param {String} _run_type Runistence type. Handles when the timer can initiate the function. Check timer_type_booleans().
function create_timer(_id, _timer, _persist_type, _run_type, _dependency_id) constructor {
	name = _id;
	timer = _timer;
	persist_type = _persist_type;
	run_type = _run_type;
	dependency_id = _dependency_id;
}

/// @param {String} _id Function ID name. Check scr_timer_functions() for the list.
/// @param {Real} _timer Timer amount.
/// @param {Real} [_persist_type] Persistence type. Handles then the timer counts down. Check timer_type_booleans().
/// @param {Real} [_run_type] Runistence type. Handles when the timer can initiate the function. Check timer_type_booleans().
/// @param {Bool} [_override] Override the timer & replace it with the added timer.
/// @param {String} [_override_id] Override ID. Defaults to _id
/// @param {Bool} [_hold] D
/// @param {String} [_hold_id] ID to handle the _dependency_type. Defaults to _id if empty or is "".
function add_timer(
		_id, _timer,
		_persist_type = 0, _run_type = 0,
		_override = false, _override_id = _id,
		_hold = false,  _hold_id = _id,
		_dependency_id = _id) {
	
	//if (_dependency_id == "") _dependency_id = _id;
	
	// Override Timer
	if (array_length(global.timers) != 0 && _override) {
		if (find_timer(_dependency_id) != -1) {
			array_delete(global.timers, find_timer(_dependency_id), 1);
		}
	}
	array_push(global.timers, new create_timer(_id, _timer, _persist_type, _run_type, _dependency_id));
	
}

/// @param {String} _id Function name.
function find_timer(_id) {
	
	if (array_length(global.timers) != 0) {
		for (var i = 0; i < array_length(global.timers); i++) {
			if (array_get(global.timers, i).name == _id) {
				return i;
			}
		}
	}
	return -1;
}

/// @description Removes all timers from the list.
function clear_timers() {
	global.timers = array_create(0);
}

/// @description Handles all timers currently running.
function handle_timers() {
	for (var i = 0; i < array_length(global.timers); i++) {
		
		var e = array_get(global.timers, i);
		
		if (!instance_exists(obj_exit_menu) && !instance_exists(obj_save_menu) && !instance_exists(obj_title_menu)) {
			if (e.timer <= 0) {
				var t = false;
				t = timer_type_booleans(e.run_type);
				
				if (t) {
					scr_timer_functions(e.name);
					array_delete(global.timers, i, 1);
				}
			} else {
				var t = false;
				t = timer_type_booleans(e.persist_type);
				if (t) e.timer--;
			}
		}
	}
}

/// @param {Real} [_type] Type to check for when something with the timer should run.
/// @description Handles the persistence & runistence for the timers and when they should run or count down.
function timer_type_booleans(_type) {
	switch (_type) {
		//case 0: return true; break;
		case 1: if (global.player.can_move) return true; break;
		case 2: if (!instance_exists(obj_game_menu)) return true; break;
		case 3: if (!instance_exists(obj_warp_anim)) return true; break;
					
		default: return true;
	}
}
