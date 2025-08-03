/// @description Follow Camera

if (follow != noone) {
	x = follow.x;
	y = follow.y;
}

//image_alpha = follow.image_alpha;
if (global.debug.is_enabled) {
	if (keyboard_check_pressed(ord("2")) and image_alpha == 0)
		image_alpha = 1;
	else if (keyboard_check_pressed(ord("2")) and image_alpha == 1)
		image_alpha = 0.5;
	else if (keyboard_check_pressed(ord("2")) and image_alpha == 0.5)
		image_alpha = 0;
}