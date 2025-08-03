
has_player_collide = false;
has_ran_function = false;

// The lower two are saved if run_function_once is true.
command_id = 0;
run_function_once = false;
// Runs the function only once then deletes itself. Use the save file stuff for this.
save_data = {
	run_function_once : run_function_once,
	command_id : command_id,
	
	x : x,
	y : y,
	
	sprite_index : sprite_index,
	image_index : image_index,
	image_speed : image_speed,
	
	image_xscale : image_xscale,
	image_yscale : image_yscale,
	image_blend : image_blend,
	image_angle : image_angle,
	
	object_index : object_index,
	layer : layer,
}