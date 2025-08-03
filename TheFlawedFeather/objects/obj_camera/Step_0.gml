
get_controls();


var _cam_left_limit = 0 + (CAMERA_WIDTH * 0.5);
var _cam_right_limit = room_width - (CAMERA_WIDTH * 0.5);
var _cam_top_limit = 0 + (CAMERA_HEIGHT * 0.5);
var _cam_bottom_limit = room_height - (CAMERA_HEIGHT * 0.5);

// Check for looking around.
if (global.player.can_move && instance_exists(obj_player)) {
	can_look_around = true;
} else {
	can_look_around = false;
}
//if (follow.x_speed == 0) {
if (can_look_around) {
	//if (keyboard_check_pressed(UP)) cam_height_value--;
	//else if (keyboard_check_pressed(DOWN)) cam_height_value++;
	
	if (obj_player.x_speed == 0 && (up_key ^^ down_key)) {
		if (up_key) {
			if (y > _cam_top_limit + cam_height_multiple) {
				cam_height_value--;
			}
		} else if (down_key) {
			if (y < _cam_bottom_limit - cam_height_multiple) {
				cam_height_value++;
			}
		} 
	} else {
		if (cam_height_value > 0) {
			cam_height_value--;
		} else if (cam_height_value < 0) {
			cam_height_value++;
		} else {
			cam_height_value = 0;
		}
	}
} else {
	if (cam_height_value > 0) {
		cam_height_value--;
	} else if (cam_height_value < 0) {
		cam_height_value++;
	} else {
		cam_height_value = 0;
	}
}
//cam_height_value = clamp(cam_height_value, -1, 1); // (1), 2, 3
cam_height_value = clamp(cam_height_value, -cam_clamp_value, cam_clamp_value);

#region SET UP
if (setup == true) {
	if (instance_exists(obj_player) && room != rm_title_screen) {
		follow = obj_player;
	
		cam_x_offset = 0; // just in case
		cam_y_offset = -16;//-32 + 8;
		x = follow.x + cam_x_offset;
		y = follow.y + cam_y_offset;
	} else {
		follow = noone;
	
		cam_x_offset = 0;
		cam_y_offset = 0;
		x = room_width / 2;
		y = room_height / 2;
	}
	x_to = x;
	y_to = y;
	//if (room != rm_init) {
	if (instance_exists(obj_player)) {
		//Helps to prevent the camera from needing to adjust over to the player
		setup = false;
	}
}
#endregion

#region WHAT TO DO
// could turn this into an enum or switch case if i want to change up anything/

if (instance_exists(obj_item_menu)) {
	cam_y_offset = -32;
} else if (instance_exists(obj_documents_menu)) {
	cam_x_offset = array_length(global.inventory.docs) > 0 ? 12 : -12;
} else if (instance_exists(obj_textbox)) {
	if (obj_textbox.current_box_type == 2) {
		// FORCED
		if (obj_textbox.textbox_main_pos) {
			cam_x_offset = -24;
		} else {
			cam_x_offset = 24;
		}
		// AUTO
		if (follow != noone) {
			cam_x_offset = 24 * follow.image_xscale;
		}
	}
	
} else {
	cam_x_offset = 0;
	cam_y_offset = -16;
}

if (global.debug.is_enabled && global.debug.cam.is_free) {
	check_if_camera_free_can_move();
	
	if (global.debug.cam.can_move) {
		var _free_cam_speed = cancel_key ? 7 : 1;
	
		var _x_move = (right_key - left_key) * _free_cam_speed;
		var _y_move = (down_key - up_key) * _free_cam_speed;
		
		x_to += _x_move;
		y_to += _y_move;
	}
} else if (follow != noone) {
			
	#region Handle Basic Camera following.
	// For testing purposes.
	//cam_x_offset = 16 * follow.image_xscale;
	
	if (follow.x + cam_x_offset < _cam_left_limit) {
		x_to = _cam_left_limit;
	} else if (follow.x + cam_x_offset > _cam_right_limit) {
		x_to = _cam_right_limit;
	} else {
		x_to = follow.x + cam_x_offset; // + (follow.image_xscale * 64);
		// if the X offset is added, then issues with the textbubble happens when it has to correct itself for a frame.
	}
	cam_height_align = cam_height_value * cam_height_multiple;
	if (follow.y + cam_height_align + cam_y_offset < _cam_top_limit ) {
		y_to = _cam_top_limit;
	} else if (follow.y + cam_height_align + cam_y_offset > _cam_bottom_limit ) {
		y_to = _cam_bottom_limit;
	} else {
		y_to = follow.y + cam_height_align + cam_y_offset;
	}
	#endregion
	
	#region Handle Camera Locking
	if instance_exists(obj_camera_lock_block) {
		with (instance_place(follow.x, follow.y, obj_camera_lock_block)) {
			if (has_player_collide) {
				obj_camera.x_to = (obj_camera.follow.x + obj_camera.cam_x_offset + x_goto) / 2;
				obj_camera.y_to = (obj_camera.follow.y + obj_camera.cam_y_offset + obj_camera.cam_height_align + y_goto) / 2;
			}
		}
	}
	#endregion	
	
	//x_to = cam_x_offset;
	//y_to = cam_x_offset;
} else {
	// if not following anyone
	x_to = room_width / 2;
	y_to = room_height / 2;
}
#endregion



#region Handle Camera Smoothing
//if (follow != noone) {
//	x_to = follow.x;
//	y_to = follow.y - 16; // - 64
//}
if (global.debug.cam.is_free && global.debug.is_enabled) {
	cam_x_smooth = 1;
	cam_y_smooth = 1;
} else if instance_exists(obj_camera_lock_block) && obj_camera_lock_block.has_player_collide {
	cam_x_smooth = 15;
	cam_y_smooth = 15;
} else if instance_exists(obj_game_menu) && (instance_exists(obj_item_menu) || instance_exists(obj_documents_menu)) {
	cam_x_smooth = 10;
	cam_y_smooth = 10;
} else if (cam_height_value != 0) {
	// High or Low
	cam_x_smooth = 5;
	cam_y_smooth = 15;
} else {
	// Normal
	cam_x_smooth = 7.5; // 10 if you dont like 7.5 later on
	cam_y_smooth = 15;
}

current_x_smooth += (cam_x_smooth - current_x_smooth) / 15;
current_y_smooth += (cam_y_smooth - current_y_smooth) / 15;
#endregion

#region Final Camera Position

x += (round(x_to) - x) / current_x_smooth;
y += (round(y_to) - y) / current_y_smooth;

if (!global.debug.cam.is_free) {
	// Clamp the camera to the room size:
	x = clamp(x, _cam_left_limit, _cam_right_limit);
	y = clamp(y, _cam_top_limit, _cam_bottom_limit);
}

camera_set_view_pos(
	view_camera[0],
	x - (cam_width * 0.5),
	y - (cam_height * 0.5));
#endregion
