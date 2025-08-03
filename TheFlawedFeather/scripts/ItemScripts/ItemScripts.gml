/// _name = global.item_list.[insert name];
function check_if_player_has_item(_name) {
	// Contingency because idk why bug happen when it doesnt constitute if it was inserted in code.
	// Nvm idk, for game play, just ignore this rn
	/*if (array_contains(global.inventory.items, _name)) {
		return true;
	}*/
	
	if (array_length(global.inventory.items) > 0) {
		for (var i = 0; i < array_length(global.inventory.items); i++) {
			if (_name == global.inventory.items[i]) {
				return true;
			}
		}
	}
	return false;
}

function item_add(_item){
	array_push(global.inventory.items, _item);
	// _item = global.item_list.[insert item];
}

function item_remove(_pos){
	if (array_length(global.inventory.items) != 0) {
		
		array_delete(global.inventory.items, _pos, 1);
		// this doesnt update the variable set figure out later
		if (_pos == array_length(global.inventory.items)) _pos -= 1;
	}
}

/// _name = global.item_list.[insert name];
function item_remove_by_name(_name) {
	// Check if the document already exists.
	var _item_exists = check_if_player_has_document(_name);
	
	if (_item_exists) {
		var _index = array_get_index(global.inventory.docs, _name);
		item_remove(_index);
	}
}
// remember to add in a function to replace items.