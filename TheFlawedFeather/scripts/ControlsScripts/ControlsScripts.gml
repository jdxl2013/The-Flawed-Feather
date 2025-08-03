function get_controls() {
	
	#region Init Controls
	// [ ARROW KEYS + ZXC ]
	up_keyboard = vk_up;
	down_keyboard = vk_down;
	left_keyboard = vk_left;
	right_keyboard = vk_right;
	confirm_keyboard = ord("Z");	// Confirm / Interact
	cancel_keyboard = ord("X");		// Run / Cancel / Skip Text
	menu_keyboard = ord("C");		// Menu / Auto Skip
	
	// [ WASD KEYS + E ]
	up_keyboard2 = ord("W");
	down_keyboard2 = ord("S");
	left_keyboard2 = ord("A");
	right_keyboard2 = ord("D");
	confirm_keyboard2 = ord("E");
	cancel_keyboard2 = ord("R");
	menu_keyboard2 = ord("Q");
	
	// [ GAMEPAD / CONTROLLER ] (note to maybe update this later)
	up_gamepad = gp_padu;
	down_gamepad = gp_padd;
	left_gamepad = gp_padl;
	right_gamepad = gp_padr;
	confirm_gamepad = gp_face1; // Bottom
	cancel_gamepad = gp_face2; // Right
	menu_gamepad = gp_face3; // Left
	
	// Controller Sticks (not implemented yet)
	horizontal_left_gamepad = gp_axislh;
	vertical_left_gamepad = gp_axislv;
	horizontal_right_gamepad = gp_axisrh;
	vertical_right_gamepad = gp_axisrv;
	#endregion
	
	#region HOLD INPUT
	#region Directional Inputs
	up_key =
		keyboard_check(up_keyboard) +
		keyboard_check(up_keyboard2) +
		gamepad_button_check(0, up_gamepad);
	down_key =
		keyboard_check(down_keyboard) +
		keyboard_check(down_keyboard2) +
		gamepad_button_check(0, down_gamepad);
	left_key =
		keyboard_check(left_keyboard) +
		keyboard_check(left_keyboard2) +
		gamepad_button_check(0, left_gamepad);
	right_key =
		keyboard_check(right_keyboard) +
		keyboard_check(right_keyboard2) +
		gamepad_button_check(0, right_gamepad);
	#endregion
	
	#region Basic Inputs
	confirm_key =
		keyboard_check(confirm_keyboard) +
		keyboard_check(confirm_keyboard2) +
		gamepad_button_check(0, confirm_gamepad);
	cancel_key =
		keyboard_check(cancel_keyboard) +
		keyboard_check(cancel_keyboard2) +
		gamepad_button_check(0, cancel_gamepad);
	menu_key =
		keyboard_check(menu_keyboard) +
		keyboard_check(menu_keyboard2) +
		gamepad_button_check(0, menu_gamepad);
	#endregion
	#endregion
	
	#region WAS PRESSED
	#region Directional Inputs (Pressed)
	up_key_pressed =
		keyboard_check_pressed(up_keyboard) +
		keyboard_check_pressed(up_keyboard2) +
		gamepad_button_check_pressed(0, up_gamepad);
	down_key_pressed =
		keyboard_check_pressed(down_keyboard) +
		keyboard_check_pressed(down_keyboard2) +
		gamepad_button_check_pressed(0, down_gamepad);
	left_key_pressed =
		keyboard_check_pressed(left_keyboard) +
		keyboard_check_pressed(left_keyboard2) +
		gamepad_button_check_pressed(0, left_gamepad);
	right_key_pressed =
		keyboard_check_pressed(right_keyboard) +
		keyboard_check_pressed(right_keyboard2) +
		gamepad_button_check_pressed(0, right_gamepad);
	#endregion
	
	#region Basic Inputs (Pressed)
	confirm_key_pressed =
		keyboard_check_pressed(confirm_keyboard) +
		keyboard_check_pressed(confirm_keyboard2) +
		gamepad_button_check_pressed(0, confirm_gamepad);
	cancel_key_pressed =
		keyboard_check_pressed(cancel_keyboard) +
		keyboard_check_pressed(cancel_keyboard2) +
		gamepad_button_check_pressed(0, cancel_gamepad);
	menu_key_pressed =
		keyboard_check_pressed(menu_keyboard) +
		keyboard_check_pressed(menu_keyboard2) +
		gamepad_button_check_pressed(0, menu_gamepad);
	#endregion
	#endregion
	
	#region Basic Inputs (Released)
	confirm_key_released =
		keyboard_check_pressed(confirm_keyboard) +
		keyboard_check_pressed(confirm_keyboard2) +
		gamepad_button_check_released(0, confirm_gamepad);
	cancel_key_released =
		keyboard_check_pressed(cancel_keyboard) +
		keyboard_check_pressed(cancel_keyboard2) +
		gamepad_button_check_released(0, cancel_gamepad);
	menu_key_released =
		keyboard_check_pressed(menu_keyboard) +
		keyboard_check_pressed(menu_keyboard2) +
		gamepad_button_check_released(0, menu_gamepad);
	#endregion
	
	#region Clamp Values
	up_key = clamp(up_key, 0, 1);
	down_key = clamp(down_key, 0, 1);
	left_key = clamp(left_key, 0, 1);
	right_key = clamp(right_key, 0, 1);
	confirm_key = clamp(confirm_key, 0, 1);
	cancel_key = clamp(cancel_key, 0, 1);
	menu_key = clamp(menu_key, 0, 1);
	
	up_key_pressed = clamp(up_key_pressed, 0, 1);
	down_key_pressed = clamp(down_key_pressed, 0, 1);
	left_key_pressed = clamp(left_key_pressed, 0, 1);
	right_key_pressed = clamp(right_key_pressed, 0, 1);
	confirm_key_pressed = clamp(confirm_key_pressed, 0, 1);
	cancel_key_pressed = clamp(cancel_key_pressed, 0, 1);
	menu_key_pressed = clamp(menu_key_pressed, 0, 1);
	
	confirm_key_released = clamp(confirm_key_released, 0, 1);
	cancel_key_released = clamp(cancel_key_released, 0, 1);
	menu_key_released = clamp(menu_key_released, 0, 1);
	
	#endregion
	
	#region Directional Inputs (Press & Hold)
	//up_key_presshold = tap_to_hold(up_key_pressed, up_key, 0);
	//down_key_presshold = tap_to_hold(down_key_pressed, down_key, 1);
	//left_key_presshold = tap_to_hold(left_key_pressed, left_key, 2);
	//right_key_presshold = tap_to_hold(right_key_pressed, right_key, 3);
	#endregion
	
	#region Specifics
	//jump_key_pressed = up_key_pressed;
	#endregion
}


//global.held_timer = array_create(7, 0); // Might be unoptimized but eh, best way ik how without adding a time var in every obj that uses this.
/// @param {Real} _pressed <Pressed button.>
/// @param {Real} _held <Held button.>
/// @param {Real} i <Array position. Must be 0-6.>
function tap_to_hold(_pressed, _held, i) {
	var _time_for_held = 10 * game_get_speed(gamespeed_fps);
	var _time_for_held_input = 0.1 * game_get_speed(gamespeed_fps);
	
	if (_pressed) {
		global.held_timer[i] = _time_for_held;
		return true;
	} else if (_held) {
		global.held_timer[i] -= 1;
		
		if (global.held_timer[i] <= 0) {
			global.held_timer[i] = _time_for_held_input;
			return true;
		} else {
			return false;
		}
	} else {
		global.held_timer[i] = _time_for_held;
		return false;
	}
}