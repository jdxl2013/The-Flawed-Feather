
function check_if_camera_free_can_move() {
	if (
		instance_exists(obj_textbox)
		|| instance_exists(obj_game_menu)
		|| instance_exists(obj_exit_menu)
		|| (instance_exists(obj_warp_anim) && !obj_warp_anim.has_warped)
		|| (!global.debug.is_enabled && !global.debug.cam.is_free)
	) {
		global.debug.cam.can_move = false;
	} else {
		global.debug.cam.can_move = true;
	}
}