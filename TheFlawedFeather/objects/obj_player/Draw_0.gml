/// @description Draw Character Sprites
get_controls();

#region FIGURE OUT ANIM STATE

if (x_speed = 0) { // IDLE SPRITES
	#region Reading Animations
	if (
		(instance_exists(obj_documents_menu) && array_length(global.inventory.docs) != 0) ||
		(instance_exists(obj_textbox) && obj_textbox.current_box_type == 2)
	) {
		if (anim_state < 6 || anim_state > 10) {
			anim_state = 6;
			x_frame = 0;
		} else if (anim_state != 10) {
			if (cancel_key_pressed) {
				anim_state = 10;
				x_frame = 2;
			} else {
				if (
					(instance_exists(obj_documents_menu) && array_length(global.inventory.docs) != 0) &&
					((obj_documents_menu.document_change && (up_key_pressed || down_key_pressed)) ||
					(confirm_key_pressed && array_length(global.inventory.docs) > 1)) &&
					obj_documents_menu.help_me_anim == 0
				) {
					anim_state = 6;
					x_frame = 0;
				} else if (instance_exists(obj_textbox) && (obj_textbox.next_anim || obj_textbox.prev_anim)) {
					if (obj_textbox.next_page_key) {
						anim_state = image_xscale == 1 ? 9 : 8;
						x_frame = image_xscale == 1 ? 3 : 5.9;
					} else if (obj_textbox.prev_page_key) {
						anim_state = image_xscale != 1 ? 9 : 8;
						x_frame = image_xscale != 1 ? 3 : 5.9;
					}
				}
			}
		}
	}
	#endregion
	#region Look Around Animation
	else if (instance_exists(obj_camera)) {
		if (obj_camera.follow == obj_player) {
			if (obj_camera.cam_height_value < 0) {
				if (obj_camera.up_key && !obj_camera.down_key && global.player.can_move) anim_state = 2;
				else anim_state = 3;
			} else if (obj_camera.cam_height_value > 0) {
				if (obj_camera.down_key && !obj_camera.up_key && global.player.can_move) anim_state = 4;
				else anim_state = 5;
			}
		}
	}
	#endregion
	else {
		anim_state = 0;
	}
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
	
	#region LOOKING ANIMS
	#region 2 - Start Looking Upwards
	case 2:
		anim_speed = 0.1;
		y_frame = 4;
		
		if (x_frame >= 2) {
			x_frame = 2;
		} else if (x_frame < 2 && x_frame >= 0) {
			anim_speed = x_frame < 1 ? 1 : 0.1;
			x_frame += (1 / anim_speed) / game_get_speed(gamespeed_fps);
		} else {
			x_frame = 0;
		}
		break;
	#endregion
	#region 3 - Stop Looking Upwards
	case 3:
		anim_speed = 0.1;
		
		if (x_frame > 0.5 && y_frame == 4) {
			x_frame -= (1 / anim_speed) / game_get_speed(gamespeed_fps);
			y_frame = 4;
		} else {
			x_frame = 0;
			y_frame = 0;
		}
		break;
	#endregion
	#region 4 - Start Looking Downwards
	case 4:
		anim_speed = 0.1;
		y_frame = 4;
		
		if (x_frame >= 6) {
			x_frame = 6;
		} else if (x_frame < 6 && x_frame >= 4) {
			anim_speed = x_frame < 5 ? 1 : 0.1;
			x_frame += (1 / anim_speed) / game_get_speed(gamespeed_fps);
		} else {
			x_frame = 4;
		}
		break;
	#endregion
	#region 5 - Stop Looking Downwards
	case 5:
		anim_speed = 0.1;
		
		if (x_frame > 4.5 && y_frame == 4) {
			x_frame -= (1 / anim_speed) / game_get_speed(gamespeed_fps);
			y_frame = 4;
		} else {
			x_frame = 0;
			y_frame = 0;
		}
		break;
	#endregion
	#endregion
	
	#region DOCUMENT ANIMS
	#region 6 - Start Document Read
	case 6:
		y_frame = 3;
		if (x_frame < 2) {
			anim_speed = 0.1;
			x_frame += (1 / anim_speed) / game_get_speed(gamespeed_fps);
		} else {
			anim_state = 7;
		}
		break;
	#endregion
	#region 7 - Document Flip Hold
	case 7:
		x_frame = 2;
		y_frame = 3;
		anim_speed = 0;
		break;
	#endregion
	#region 8 - Document Flip LEFT <--
	case 8:
		y_frame = 3;
		anim_speed = 0.1;
		
		if (x_frame > 3) {
			x_frame -= (1 / anim_speed) / game_get_speed(gamespeed_fps);
		} else {
			x_frame = 2;
			anim_state = 7;
		}
		break;
	#endregion
	#region 9 - Document Flip RIGHT -->
	case 9:
		y_frame = 3;
		anim_speed = 0.1;
		
		if (x_frame <= 5.8) {
			x_frame += (1 / anim_speed) / game_get_speed(gamespeed_fps);
		} else {
			x_frame = 2;
			anim_state = 7;
		}
		break;
	#endregion
	#region 10 - End Document Read
	case 10:
		y_frame = 3;
		if (x_frame > 0.2) {
			anim_speed = 0.1;
			x_frame -= (1 / anim_speed) / game_get_speed(gamespeed_fps);
		} else {
			anim_state = 0;
			x_frame = 0;
		}
		break;
	#endregion
	#endregion
}
#endregion

#region PLAYER DRAW
draw_sprite_part_ext(current_char_sheet, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, char_brightness, 1);

/*gpu_set_blendmode(bm_add);
draw_sprite_part_ext(spr_costel_alphaTest, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, c_outp_orange, 1);
gpu_set_blendmode(bm_normal);*/

	// Kinda odd how applying the image xscale to the offset makes it work.
	// Idk lol im not gonna bother, it works lol
draw_sprite_part_ext(char_bandana, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), y - y_offset,
	image_xscale, 1, char_brightness, char_bandana_alpha);
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
draw_sprite_part_ext(char_bandana, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), (y - y_offset) + (frame_size * 2),
	image_xscale, -1, char_brightness, char_bandana_alpha * char_reflection_alpha);
draw_sprite_part_ext(char_eye_glow, 0,
	floor(x_frame) * frame_size, y_frame * frame_size,
	frame_size,	frame_size,
	x - (x_offset * image_xscale), (y - y_offset) + (frame_size * 2),
	image_xscale, -1, c_white, char_eye_alpha * char_reflection_alpha);
#endregion