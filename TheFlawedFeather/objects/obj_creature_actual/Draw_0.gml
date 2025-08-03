

// ONLY USE 0, 1, 3, 4
switch (anim_state) {
	#region 0 - Idle
	case 0:
		anim_speed = 7;
		x_frame += anim_speed / game_get_speed(gamespeed_fps);
		if (x_frame >= 3.9) x_frame = 0;
		y_frame = 0;
		break;
	#endregion
	#region 1 - Prep Transition To Scary
	case 1:
		anim_speed = 7;
		x_frame = 0;
		y_frame = 1;
		anim_state = 2;
		break;
	case 2:
		anim_speed = 10;
		x_frame += anim_speed / game_get_speed(gamespeed_fps);
		if (x_frame >= 4.9) anim_state = 3;
		y_frame = 1;
		break;
	#endregion
	#region 3 - Scary Idle
	case 3:
		anim_speed = 7;
		x_frame += anim_speed / game_get_speed(gamespeed_fps);
		if (x_frame >= 3.9) x_frame = 0;
		y_frame = 2;
		break;
	#endregion
	#region 4 - Prep Transition To Normal
	case 4:
		anim_speed = 7;
		x_frame = 4.9;
		y_frame = 1;
		anim_state = 5;
		break;
	case 5:
		anim_speed = 10;
		x_frame -= anim_speed / game_get_speed(gamespeed_fps);
		if (x_frame <= 0.1) anim_state = 0;
		y_frame = 1;
		break;
	#endregion
}






draw_sprite_part_ext(spr_happy_creature_sheet, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, c_white, 1);

draw_sprite_part_ext(spr_happy_creature_shadow_sheet, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, c_white, 0.5);