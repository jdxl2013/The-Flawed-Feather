visible = global.debug.is_enabled ? true : false;

if (
	instance_exists(obj_player)
	&& place_meeting(x, y, obj_player)
) {
	has_player_collide = true;
} else {
	has_player_collide = false;
	has_ran_function = false;
}

if (has_player_collide && !has_ran_function) {
	has_ran_function = true;
	
	scr_collide_block_functions(command_id);
	
	if (run_function_once) instance_destroy();
}