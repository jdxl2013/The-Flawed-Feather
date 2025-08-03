/// _name = global.documents_list.[insert name];
function check_if_player_has_document(_name) {
	if (array_length(global.inventory.docs) > 0) {
		for (var i = 0; i < array_length(global.inventory.docs); i++) {
			if (_name == global.inventory.docs[i]) {
				return true;
			} 
		}
	}
	return false;
}


/// _name = global.documents_list.[insert name];
function documents_add(_name){
	
	// Check if the document already exists.
	var _doc_exists = check_if_player_has_document(_name);
	
	// Add document.
	if (!_doc_exists) {
		array_push(global.inventory.docs, _name);
		// _name = global.documents_list.[insert name];
		
		// Update time for it.
		for (var i = 0; i < array_length(global.inventory.docs); i++) {
			if (_name == global.inventory.docs[i]) {
				global.inventory.docs[i].time_created = string(current_time);
				break;
			} 
		}
	}
}

function documents_remove(_pos) {
	if (array_length(global.inventory.docs) != 0) {
		
		array_delete(global.inventory.docs, _pos, 1);
		// this doesnt update the variable set figure out later
		if (_pos == array_length(global.inventory.docs)) _pos -= 1;
	}
}
function documents_remove_by_name(_name) {
	// Check if the document already exists.
	var _doc_exists = check_if_player_has_document(_name);
	
	if (_doc_exists) {
		var _index = array_get_index(global.inventory.docs, _name);
		documents_remove(_index);
	}
}


function documents_order(a, b, _order) {
	// a,b for ASCENDING
	// b,a for DESCENDING
	
	if (_order == 1 && a.time_created != b.time_created) { // Chronological
		return a.time_created - b.time_created;
	} else if (_order == 2 && a.read_status != b.read_status) { // Read Status
		return a.read_status - b.read_status;
	} else { // Alphabetical
		if (string_lower(a.name) < string_lower(b.name)) return -1;
		else if (string_lower(a.name) > string_lower(b.name)) return 1;
		else return 0;
	}
}