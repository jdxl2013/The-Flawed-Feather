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

next_anim = false;
prev_anim = false;


// Set to the camera
textbox_x = 0;
textbox_y = 0;

textbox_main_pos = true;

// Action Box
textbox_width = 64 + 50 + 1;
textbox_height = CAMERA_HEIGHT - 18 - 14 - 8;//37 + 100;
// Selection Indicator
indicator_width = 64;//48;
indicator_height = 9 + 4;
// Ordered Box
orderbox_width = 98;
orderbox_height = 23;//9 + 5;

box_spr = spr_textbox;
box_img = 0;
box_spd = 0;
box_spr_width = sprite_get_width(box_spr);
box_spr_height = sprite_get_height(box_spr);
#endregion

#region Options/Choices

//global.inventory.items = array_create(0);
//option[0] = 0;
option_number = array_length(global.inventory.docs);
option_pos = 0;
scroll_buffer_bound = "D";
//menu_level = 0;

option[0] = "";
if (array_length(global.inventory.docs) > 0) {
	for (var i = 0; i < array_length(global.inventory.docs); i++) {
		option[i] = global.inventory.docs[i].name;
	}
}

order_option[0] = "Alphabetical";
order_option[1] = "Chronological";
order_option[2] = "Read Status"; // New, Partly Read, or Fully
scending_option[0] = "↓ Ascending";
scending_option[1] = "↑ Descending";

order_value = global.doc_menu.order;
scending_value = global.doc_menu.scend;
//current_order[0] = order_option[order_value];
//current_order[1] = scending_option[scending_value];
#endregion

accept_key = false;
key_cancel = false;
controls_locked = false;

setup = false;

document_change = false;
#endregion
