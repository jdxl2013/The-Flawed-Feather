
audio_play_sound(snd_menu_open, 3, false);

#region GENERAL INIT
depth = -999;
box_alpha = 0;
text_alpha = 0;
// 0.5, 0.9, 1
// Check the Creation Anim for init values
trans_alpha = 0.5; // used to become transparent when extra menus are called.

can_use_menu = true;
controls_locked = true;

// Animations
anim_x_offset = -5;
anim_y_offset = 0;

//delete_anim = false;
//create_anim = true; // happens on creation, needing to be true
help_me_anim = 1; // check the Femtanyl /j push for why i named it this -from my declining mental state
/*
	INT			NAME			DESCRIPTION
	0			Idle			Does Nothing.
	1			Creation		Animation to become normal initial values. Also works to reset the values.
	2			Deletion		Animation to then delete the object.
	3			Deletion		Deletion but specific to the main menu.
	4			Transparent		Become transparent.
	5			Transparent		Become not transparent.
*/


next_anim = false;
prev_anim = false;


// Set to the camera
textbox_x = 0;
textbox_y = 0;

textbox_main_pos = true;

box_spr = spr_textbox;
box_img = 0;
box_spd = 0;
box_spr_width = sprite_get_width(box_spr);
box_spr_height = sprite_get_height(box_spr);
#endregion

#region Options/Choices

sub_menus = array_create(0);
// Menus
array_push(sub_menus, "TUTORIAL");
array_push(sub_menus, "SETTINGS");
array_push(sub_menus, "EXIT");
//array_push(sub_menus,  "[DEBUG]");
//if (global.debug.is_enabled) 
//array_push(sub_menus, "SAVE GAME");

// Usable Menus
option = [];
for (var i = 0; i < array_length(sub_menus); i++) {
	
	//if (!debug_mode && i != 4) {
		option[i] = sub_menus[i];
	//}
}

option_number = array_length(option);
option_pos = 0;

#endregion

#region Calculate Height
option_draw_height = string_height(option[0]) + 2;
option_draw_y_offset = 4;

textbox_height = 0;
textbox_width = 64;

#endregion

accept_key = false;
//cancel_key = false;
key_cancel = false;

setup = false;