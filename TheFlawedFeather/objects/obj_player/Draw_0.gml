/// @description Draw Character Sprites
get_controls();

#region FIGURE OUT ANIM STATE

if (x_speed = 0) { // IDLE SPRITES
	anim_state = 0;
} else { // MOVEMENT SPRITES
	anim_state = 1;
}
#endregion

#region HANDLE SPRITES TO USE
switch (anim_state) {
	#region 0 - Idle (Do Nothing)
	case 0:
		/* NOTE: I do plan on adding more idle sprites such as
		reading notes or stuff so probably add more if cases to
		do so later. */
		anim_speed = 0;
		x_frame = 0; // 0.9
		y_frame = 0;
		break;
	#endregion
	#region 1 - Walking / Running
	case 1:
		
		if (x_speed != 0) {
			if (!key_run) { // Walking - 0.135 per second
				anim_speed = anim_walk;
				y_frame = 1;
			} else { // Running - 0.08 per second
				anim_speed = anim_run;
				y_frame = 2;
			}
			// Draws Sprites
			x_frame += (1 / anim_speed) / game_get_speed(gamespeed_fps);
			if (x_frame >= anim_length) x_frame = 0;
		} else {
			x_frame = 0;
			y_frame = 0;
		}
		break;
	#endregion
	
}
#endregion

#region PLAYER DRAW

draw_sprite_part_ext(current_char_sheet, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, char_brightness, 1);

draw_sprite_part_ext(char_eye_glow, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, c_white, char_eye_alpha);
	// omg cosmetics are literally that easy omg omg.
	/* need to still figure if its possible to just set this to a
	null sprite when nothing is being worn or its needed to do a
	2nd sheet with nothing on it... or i can turn it into an
	if statement instead... that might be the go to. */

// Book Reading spr_book_item_sheet
if (anim_state >= 6 && anim_state <= 10) {
	draw_sprite_part_ext(spr_book_item_sheet, 0,
		floor(x_frame) * frame_size, 0 * frame_size,
		frame_size,	frame_size,
		x - (x_offset * image_xscale), y - y_offset,
		image_xscale, 1, char_brightness, 1);
}
#endregion

#region REFLECTIONS
draw_sprite_part_ext(current_char_sheet, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), (y - y_offset) + (frame_size * 2),
	image_xscale, -1, char_brightness, char_reflection_alpha);
draw_sprite_part_ext(char_eye_glow, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), (y - y_offset) + (frame_size * 2),
	image_xscale, -1, c_white, char_eye_alpha * char_reflection_alpha);
#endregion