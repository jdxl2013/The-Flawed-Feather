
#region GENERAL INIT
//depth = -999 + 1;
box_alpha = 0;
text_alpha = 0;
// 0.5, 0.9, 1
// Check the Creation Anim for init values


// Animations
anim_x_offset = 0;
anim_y_offset = 10;

//delete_anim = false;
//create_anim = true; // happens on creation, needing to be true
help_me_anim = 1; // check the Femtanyl /j push for why i named it this -from my declining mental state
/*
	INT			NAME			DESCRIPTION
	0			Idle			Does Nothing.
	1			Creation		Animation to become normal initial values. Also works to reset the values.
	2			Deletion		Animation to then delete the object.
	3			Deletion		Deletion but specific to the main menu.
*/

next_anim = false;
prev_anim = false;


// Set to the camera
textbox_x = 0;
textbox_y = 0;

textbox_main_pos = true;

textbox_width = 128 - 16 - 4 + 64;
textbox_height = 128 + 16;

box_spr = spr_textbox;
box_img = 0;
box_spd = 0;
box_spr_width = sprite_get_width(box_spr);
box_spr_height = sprite_get_height(box_spr);
#endregion

#region Options/Choices

info_text = "";
option[0] = "DENY";
option[1] = "CONFIRM";
optionAction = 0;

option_number = array_length(option);
option_pos = 0;

#endregion

accept_key = false;
cancel_key = false;

setup = false;