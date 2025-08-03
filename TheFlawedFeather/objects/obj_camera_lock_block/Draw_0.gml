
if (global.debug.is_enabled) {
	
	// Draw the bounding box
	draw_sprite_ext(
		spr_camera_lock_block, 0,
		x, y,
		image_xscale, image_yscale,
		0, c_white,
		0.5
	);
	
	// Draw the camera target.
	if (has_player_collide) {
		draw_sprite_ext(
			spr_camera_lock_block, 0,
			x_goto, y_goto,
			0.5, 0.5,
			0, c_white,
			1
		);
	}
}