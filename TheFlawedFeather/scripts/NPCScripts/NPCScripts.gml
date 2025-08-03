
function spawn_bus(_x, _y, _speed = 5, time_deletion = 10) {
	with (instance_create_layer(_x, _y, "Player", obj_bus)) {
		clamp_speed = _speed;
		time_for_delete = time_deletion;
		timer = time_for_delete * game_get_speed(gamespeed_fps);
		
		if (instance_exists(obj_player)) {
			depth = obj_player.depth - 1;
		}
	}
}

function spawn_creature_cutscene(_x, _y) {
	instance_create_layer(_x, _y, "Player", obj_creature_cutscene);
}