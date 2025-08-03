audio_play_sound(snd_menu_open, 3, false);

first_op_calc = 0;
last_op_calc = 0;

#region Menu Stuffs
box_alpha = 0;
text_alpha = 0;
// 0.5, 0.9, 1
// Check the Creation Anim for init values


// Animations
anim_x_offset = -5;
anim_y_offset = 0;

help_me_anim = 1;
/*
	INT			NAME			DESCRIPTION
	0			Idle			Does Nothing.
	1			Creation		Animation to become normal initial values. Also works to reset the values.
	2			Deletion		Animation to then delete the object.
	3			Deletion		Deletion but specific to the main menu.
*/

current_menu = 0; // Using this for cases such as asking if your sure to discard an object, etc.
/*
	INT			NAME			DESCRIPTION
	0			Main			When you are on the main menu to select what to do.
	1			Discard			Asks if you want to discard or not.
								Option is grayed out if an item can't be discarded.
								If it can't then the menu won't be pulled up.
								(for now its only going to delete items without asking)
	2			Combine			Simply indicates that you are currently trying to combine items.
								If you end up pressing X it just backs out of doing so.
								(will not implement unless needed)
*/

next_anim = false;
prev_anim = false;


// Set to the camera
textbox_x = 0;
textbox_y = 0;

textbox_main_pos = true;

// Inventory Bar
textbox_width = CAMERA_WIDTH - 64 - 8 + 2 - 11; //128;
textbox_height = 16;
// Image Box
image_box_width = 43; //48;
image_box_height = 43; //48;
// Description Box
info_box_width = textbox_width - image_box_width - 1; //- 8 - 4;
info_box_height = 43;//image_box_height;
// Action Box
action_box_width = 64;
action_box_height = 37;

box_spr = spr_textbox;
box_img = 0;
box_spd = 0;
box_spr_width = sprite_get_width(box_spr);
box_spr_height = sprite_get_height(box_spr);
#endregion

#region Options/Choices

//global.inventory.items = array_create(0);
//option[0] = 0;
option_number = array_length(global.inventory.items);
option_pos = 0;
scroll_buffer_bound = "R";
//menu_level = 0;

option = array_create(0);
array_push(option, "USE");
//array_push(option, "INSPECT");
if (global.debug.is_enabled) array_push(option, "DISCARD");
array_push(option, "BACK");
main_option_pos = 0;
main_option_number = array_length(option);

#endregion

accept_key = false;
//cancel_key = false;
key_cancel = false;
controls_locked = false;

setup = false;
#endregion
