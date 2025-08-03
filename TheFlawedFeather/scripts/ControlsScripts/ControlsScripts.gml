function get_controls() {
	
	#region Init Controls
	// [ ARROW KEYS + ZXC ]
	up_keyboard = vk_up;
	down_keyboard = vk_down;
	left_keyboard = vk_left;
	right_keyboard = vk_right;
	
	
	run_keyboard = vk_shift;
	
	// [ WASD KEYS + E ]
	up_keyboard2 = ord("W");
	down_keyboard2 = ord("S");
	left_keyboard2 = ord("A");
	right_keyboard2 = ord("D");
	
	
	run_keyboard2 = vk_rshift;
	
	// Mouse & Escape
	confirm_mouse = mb_left;
	cancel_mouse = mb_right;
	menu_mouse = vk_escape;
	
	#endregion
	
	#region HOLD INPUT
	#region Directional Inputs
	up_key =
		keyboard_check(up_keyboard) +
		keyboard_check(up_keyboard2);
	down_key =
		keyboard_check(down_keyboard) +
		keyboard_check(down_keyboard2);
	left_key =
		keyboard_check(left_keyboard) +
		keyboard_check(left_keyboard2);
	right_key =
		keyboard_check(right_keyboard) +
		keyboard_check(right_keyboard2);
	#endregion
	
	#region Basic Inputs
	confirm_key =
		mouse_check_button(confirm_mouse);
	cancel_key =
		mouse_check_button(cancel_mouse);
	menu_key =
		keyboard_check(menu_mouse);
	#endregion
	#endregion
	
	#region WAS PRESSED
	#region Directional Inputs (Pressed)
	up_key_pressed =
		keyboard_check_pressed(up_keyboard) +
		keyboard_check_pressed(up_keyboard2);
	down_key_pressed =
		keyboard_check_pressed(down_keyboard) +
		keyboard_check_pressed(down_keyboard2);
	left_key_pressed =
		keyboard_check_pressed(left_keyboard) +
		keyboard_check_pressed(left_keyboard2);
	right_key_pressed =
		keyboard_check_pressed(right_keyboard) +
		keyboard_check_pressed(right_keyboard2);
	#endregion
	
	#region Basic Inputs (Pressed)
	confirm_key_pressed =
		mouse_check_button_pressed(confirm_mouse);
	cancel_key_pressed =
		mouse_check_button_pressed(cancel_mouse);
	menu_key_pressed =
		keyboard_check_pressed(menu_mouse);
	#endregion
	#endregion
	
	#region Basic Inputs (Released)
	confirm_key_released =
		mouse_check_button_released(confirm_mouse);
	cancel_key_released =
		mouse_check_button_released(cancel_mouse);
	menu_key_released =
		keyboard_check_released(menu_mouse);
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
	
	running_key = clamp(
		keyboard_check(run_keyboard) + keyboard_check(run_keyboard2),
		0, 1
	);
	#endregion
	
	
}
