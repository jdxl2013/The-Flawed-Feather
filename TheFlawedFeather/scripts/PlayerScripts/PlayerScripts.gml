// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function handle_character(argument0) {
	var _gender = global.player.char.gender;
	// 0	M
	// 1	F
	char_eye_glow = spr_player_eyes;
	
	switch(argument0) {
		case PLAYER_FULL:
			if (_gender = 0) {
				char_sheet_a = spr_player_m_full;
				char_sheet_b = spr_player_m_full;
			} else {
				char_sheet_a = spr_player_f_full;
				char_sheet_b = spr_player_f_full;
			}
		break;
		case PLAYER_INTR:
			char_sheet_a = spr_player_m_x;
			char_sheet_b = spr_player_f_x;
		break;
		case PLAYER_HALF:
			if (_gender = 0) {
				char_sheet_a = spr_player_m_right;
				char_sheet_b = spr_player_m_left;
			} else {
				char_sheet_a = spr_player_f_right;
				char_sheet_b = spr_player_f_left;
			}
		break;
		case PLAYER_NULL:
			char_sheet_a = spr_player_null;
			char_sheet_b = spr_player_null;
		break;
	}
	
	var _main_side_dir = global.player.char.main_side_right;

	if (_main_side_dir == 1) {
		current_char_sheet = image_xscale == 1 ?
			char_sheet_a : char_sheet_b;
	} else {
		current_char_sheet = image_xscale == -1 ?
			char_sheet_a : char_sheet_b;
	}
}

/// @param {Asset.GMRoom} _target_room
/// @param {Real} _target_x
/// @param {Real} _target_y
/// @param {Real} _target_dir
/// @param {Bool} [_instant_warp] Set to true to skip the animation.
/// @param {String,Array} [_script_ids] Uses scr_warp_functions(). Ran in obj_warp_anim.
/// If String OR Size 1 Array[], then ID runs on Warp.
/// If size 2 or 3 array, then each ID runs on: [0] Anim Start, [1] Room Transition, [2] Anim End
/// @description Warps the player to a different room or location.
function warp_player(_target_room, _target_x, _target_y, _target_dir, _instant_warp = false, _script_ids = "") {
	
	if (!instance_exists(obj_warp_anim)) {
		// Gets called in the case that you want it to warp without a warp block.
		// The script will run again in the object, going to the else code to actually warp.
		var _inst = instance_create_depth(0, 0, -9999, obj_warp_anim);
		_inst.target_room = _target_room;
		_inst.target_x = _target_x;
		_inst.target_y = _target_y;
		_inst.target_dir = _target_dir;
		_inst.warp_script_ids = _script_ids;
		
		_inst.instant_warp = _instant_warp;
	} else {
		#region Pre Warp
		// Clear Any Other Objects
		if (instance_exists(obj_textbox)) instance_destroy(obj_textbox);
		if (instance_exists(obj_game_menu)) instance_destroy(obj_game_menu);
		if (instance_exists(obj_exit_menu)) instance_destroy(obj_exit_menu);
		#endregion
		
		if (room != _target_room) room_goto(_target_room);
		
		#region Post Warp
		
		#region Handle Player & Camera Positions
		if (_target_room == rm_title_screen) {
			if (instance_exists(obj_player)) {
				instance_destroy(obj_player);
			}
			obj_camera.setup = true;
		} else {
			if (!instance_exists(obj_player)) {
				// Creates player position if it doesn't exist.
				instance_create_layer(_target_x, _target_y, "Player", obj_player);
			} else {
				// Sets player position.
				obj_player.x = _target_x;
				obj_player.y = _target_y;
			}
			// Player direction.
			// If its not 1 or -1 then the direction shouldnt change
			if (_target_dir == 1 || _target_dir == -1)
				obj_player.image_xscale = _target_dir;
	
			// Sets camera position
			obj_camera.x = obj_player.x;
			obj_camera.y = obj_player.y + obj_camera.cam_y_offset;
			obj_camera.x_to = obj_camera.x;
			obj_camera.y_to = obj_camera.y;
			
			// Set Mouse Position
			obj_mouse.x = obj_mouse.x_offset;
			obj_mouse.y = obj_mouse.y_offset;
			obj_mouse.x_to = obj_mouse.x_to_offset;
			obj_mouse.y_to = obj_mouse.y_to_offset;
		}
		#endregion
		
		#region Script to run on transition.
		/*
		if (is_array(_script_ids)) {
			scr_warp_functions(_script_ids[1]);
		} else {
			scr_warp_functions(_script_ids);
		}
		*/
		#endregion
		
		#endregion
	}
}

function check_if_player_can_move() {
	if (
		instance_exists(obj_textbox) ||
		instance_exists(obj_game_menu) ||
		instance_exists(obj_exit_menu) ||
		(instance_exists(obj_warp_anim) && !obj_warp_anim.has_warped) ||
		(global.debug.is_enabled && global.debug.cam.is_free)
	) {
		global.player.can_move = false;
	} else {
		global.player.can_move = true;
	}
}

function playerstate_free() {
	check_if_player_can_move();
	
	//if (global.player.can_move == true) {
		var _on_ground = collision_point(x, y + y_speed, obj_wall, 0, 0);
		
		if (key_run) {
			move_speed = run_speed;
		} else {
			move_speed = walk_speed;
		}
		
		if (place_meeting(x, y, obj_warp_block) && instance_exists(obj_warp_anim)) {
			// Can no longer control which way your moving when you choose to enter to the sides.
			// Auto walks you basically.
			x_speed = image_xscale * move_speed;
		} else if ((instance_exists(obj_warp_anim)) && (room != obj_warp_anim.target_room)) {
			// Can't move in the case that you asked to teleport from a textbox.
			x_speed = 0;
		} else {
			if (global.player.can_move == true) x_speed = (key_right - key_left) * move_speed;
			else x_speed = 0;
		}
		
		// Draws the sprite in the right direction when moving.
		/* I'm not even gonna bother with extra sprites, 
		such as how Rianne has the ear ring on their right ear only. */
		if (x_speed > 0) image_xscale = 1;
		else if (x_speed < 0) image_xscale = -1;
		
		/*
		if (_on_ground == noone) {
			y_speed += grav;
			y_speed = clamp(y_speed, -10, 10);
		} else {
			y_speed = 0;
		} */
		
		#region SLOPES & COLLISION
		// Slopes Tutorial Im Following
		var _sub_pixel = 0.1; // depends on how smooth or tight yuo move up and down
		if (place_meeting(x + x_speed, y, obj_wall)) {
			
			// abs(x_speed) - 1, the -1 is how many pixels max you can go up i think
			// the abs is in the case of pixel perfect slopes
			// ok the abs value was causing issue for not going upwards idk why lol
			// ok changed it to +1 and now it works, wha
			// programming will make you feel like an idiot when something doesnt work only to find that you miss spelt something or used the wrong function
			// the -1 is just the cap for when you can move upwards
			if (!place_meeting(x + x_speed, y - abs(x_speed) - 1, obj_wall)) {
				while (place_meeting(x + x_speed, y, obj_wall)) {
					y -= _sub_pixel;
				}
				//x_speed = 0.5;
			} else {
				var _pixel_check = _sub_pixel * sign(x_speed);
				while (!place_meeting(x + _pixel_check, y, obj_wall)) {
					x += _pixel_check;
				}
				// Stops on trying to move on collision
				x_speed = 0;
			}
		}
		
		//Walk down slopes
		if (y_speed >= 0) {
			for (var i = 1; i <= 2; i++) {
				if (!place_meeting(x + x_speed, y + i, obj_wall) && place_meeting(x + x_speed, y + abs(x_speed) + i, obj_wall)) {
					while (!place_meeting(x + x_speed, y, obj_wall)) {
						y += _sub_pixel;
					}
				}
			}
		}
		
		#endregion
		
		// So In order to do this tutorial, I have to not use the move & collide function
		// I mean thats fine lol just odd
		x += x_speed;
		
		//move_and_collide(x_speed, y_speed, obj_wall, 4, 0, 0, move_speed, 10);

	//} else {
	//	x_speed = 0;	
	//}
}