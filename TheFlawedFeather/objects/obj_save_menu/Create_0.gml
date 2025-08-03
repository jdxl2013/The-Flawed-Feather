

first_op_calc = 0;
last_op_calc = 0;

#region Menu Stuffs
box_alpha = 0;
text_alpha = 0;
// 0.5, 0.9, 1
// Check the Creation Anim for init values


// Animations
anim_x_offset = 0;
anim_y_offset = 10;

help_me_anim = 1;
/*
	INT			NAME			DESCRIPTION
	0			Idle			Does Nothing.
	1			Creation		Animation to become normal initial values. Also works to reset the values.
	2			Deletion		Animation to then delete the object.
*/

next_anim = false;
prev_anim = false;


// Set to the camera
textbox_x = 0;
textbox_y = 0;

textbox_main_pos = true;

// Action Box
textbox_width = CAMERA_WIDTH - 16;
textbox_height = CAMERA_HEIGHT - 16;

// Settings Box
op_box_width = 36 * 3;
op_box_height = textbox_height - 16;

// Save Slot
slotbox_width = textbox_width - 16 - op_box_width - 1;
slotbox_height = 36;


box_spr = spr_textbox;
box_img = 0;
box_slot_img = 1;
box_spd = 0;

box_spr_width = sprite_get_width(box_spr);
box_spr_height = sprite_get_height(box_spr);
#endregion

#region Options/Choices

slot_number = global.save_slot_amount;
if (slot_number <= 0) slot_number = 9; // Prevent Crashes lol
selected_slot = 0;

save_slot_data = update_visible_save_slot_data(slot_number);

slot_was_selected = false;

option = array_create(0);

if (room != rm_title_screen) array_push(option, "SAVE");
array_push(option, "LOAD"); // LOAD FILE or NEW GAME
array_push(option, "COPY");
array_push(option, "DELETE");
if (!global.debug.is_enabled) array_push(option, "FILE LOCATION"); // Quality of life.
array_push(option, "BACK"); // Quality of life.
// Debate on if you can access the file location based on debug or on the main menu. might do the latter.

option_number = array_length(option);
option_pos = 0;
scroll_buffer_bound = "D";

#endregion

#region Other
accept_key = false;
key_cancel = false;
controls_locked = false;

setup = false;

flavor_text = "";
/*
Use for each save point. Won't be like Undertale but more like Minecraft / Terraria. Splash text.
*/
#endregion
