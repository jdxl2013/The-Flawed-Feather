
if (global.debug.is_enabled) {
	
	// Draw the camera target.
	var _color = has_player_collide ? c_green : c_yellow;
	if (has_ran_function) _color = c_red;
	
	// Draw the bounding box
	draw_sprite_ext(
		spr_collide_cmd_block, 0,
		x, y,
		image_xscale, image_yscale,
		0, _color,
		0.5
	);
	
	
}