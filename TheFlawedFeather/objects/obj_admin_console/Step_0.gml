/// @description Insert description here
// You can write your code in this editor



if (focus = true) {
	
	if (keyboard_check_pressed(vk_enter)) focus = false;
	
	if (string_length(input) < max_char) input = keyboard_string;
	else if (keyboard_check_pressed(vk_backspace)) {
		input = string_delete(input, max_char, 1);
		keyboard_string = input;
	}
}