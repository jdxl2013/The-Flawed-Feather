

//var _mask = sprite_duplicate(sprite_index);
//mask_index = _mask;

#region Object Anims

if (pickup_anim) {
	if (object_alpha > 0) {
		object_alpha -= 0.2;
		if (instance_exists(obj_player)) {
			x += (obj_player.x - x) / 25;
			y += ((obj_player.y + 16) - y) / 25;
		} else {
			object_y_offset += 0.5;
		}
	} else {
		instance_destroy();
	}
}

// Draws Object Sprite
draw_sprite_ext(
	sprite_index, -1,
	x + object_x_offset,
	y + object_y_offset,
	image_xscale, image_yscale,
	image_angle, image_blend, object_alpha);

#endregion

#region Popup Stuffs

if (can_interact) {
	if (popup_alpha < 1) {
		popup_alpha += 0.2;
		popup_y_offset -= 0.2;
	}
} else {
	if (popup_alpha > 0) {
		popup_alpha -= 0.2;
		popup_y_offset += 0.2;
	}
}


// Draws Popup
// Draws only when nececary, when its alpha is not at 0.
if popup_alpha > 0 {
	
	//popup_index += spr_popup.image_speed / game_get_speed(gamespeed_fps);
	// for absolutely no reason this above line stopped working and idk why, setting it manually for now
	popup_index += 1 / game_get_speed(gamespeed_fps);
	//if (popup_index > spr_popup.image_number - 1)
	// same issue lol
	if (popup_index > 2)
		popup_index = 0;
	//draw_sprite_ext(InteractSheet, 2, x - 0.5, bbox_top + popup_y_offset, 1, 1, 0, c_white, popup_alpha);
	draw_sprite_ext(spr_popup, popup_index, x - 0.5, bbox_top + popup_y_offset, 1, 1, 0, c_white, popup_alpha);
} else {
	if (popup_index != 0) {
		popup_index = 0;
	}
}

#endregion

#region Flaws
if (marked_for_flaw) {
	if (can_interact) {
		flaw_rot = obj_mouse.to_angle;
	} else {
		if (flaw_rot < 360) flaw_rot++;
		else flaw_rot = 0;
	}
	var _scale = ((sprite_width + sprite_height) / 2) / 32;
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(
		spr_mouse, 3,
		x, y - (sprite_height / 2),
		_scale, _scale,
		flaw_rot, c_yellow, 1
	);
	gpu_set_blendmode(bm_normal);
}
#endregion