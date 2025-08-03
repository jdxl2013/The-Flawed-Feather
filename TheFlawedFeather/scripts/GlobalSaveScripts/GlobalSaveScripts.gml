
function save_settings(){
	var _file_name = "settings.txt";
	
	// What data needs to be saved.
	var _save_struct = {
		settings : global.settings,
		started_game : global.started_game,
	}
	var _json_str = json_stringify(_save_struct);
	
	var _buffer = buffer_create(string_byte_length(_json_str) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json_str);
	buffer_save(_buffer, _file_name);
	buffer_delete(_buffer);
}

function load_settings(){
	var _file_name = "settings.txt";
	if (!file_exists(_file_name)) exit;
	
	var _buffer = buffer_load(_file_name);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_struct = json_parse(_json);
	
	#region Load Data
	
	global.settings = _load_struct.settings;
	global.started_game = _load_struct.started_game;
	
	#endregion
}