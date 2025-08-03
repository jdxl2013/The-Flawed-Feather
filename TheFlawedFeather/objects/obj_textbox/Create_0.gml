
text_id = 0; // Save the ID here to check what it's doing. I.E.: the documents menu.

page_array = array_create(0, new textbox_create_page());

#region Controls
accept_key = 0;

skip_key = 0;
auto_skip_key = 0;

can_hold_auto_skip_key = false; // Set to true when on the 2nd page or you initially pressed while on the first page.

currently_doing_skip = 0;

next_page_key = 0;
prev_page_key = 0;
close_document_key = 0;
#endregion

#region Animations & Visuals
depth = -1111;//-999;
box_alpha = 0; // Current

final_box_alpha = 1; // Get To

text_alpha = 0;
// 0.5, 0.9, 1
// Check the Creation Anim for init values


// Animations
textbox_alternate_pos = false;

anim_x_offset = 0;
anim_y_offset = 0;
delete_anim = false;
create_anim = true; // only meant to happen once
next_anim = false;
prev_anim = false;
change_anim = false; // Used when the textbox values updates into the next page.

// Set to the camera
textbox_x = 0;
textbox_y = 0;
textbox_x_offset[0] = 0;
textbox_y_offset[0] = 0;
#endregion


// To save the value for usage in other places.
textbox_main_pos = true;
current_box_type = 0;

// Base Textbox Type Sizes
textbox_width = 190; // CAMERA_WIDTH - (2 * 64); (192) // * 48
textbox_height = 51; //64; //(CAMERA_HEIGHT / 2) - 8;
textbubble_width = 90 + (5 * 5); // 80 <90>
textbubble_height = 36;
document_width = (CAMERA_WIDTH / 2) - 32 + 12; // - 8
document_height = CAMERA_HEIGHT - (2 * 8);
cinematic_width = CAMERA_WIDTH;
cinematic_height = CAMERA_HEIGHT / 3;

final_textbox_width[0] = 0;
final_textbox_height[0] = 0;

follow[0] = noone;

box_spr = spr_textbox;
box_img = 0;
box_spd = 0;

page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

text_border = 8;
line_sep = 8;
/*	8 - Initial
	10 - Font Optimized
		10 helps with the readability but the char. limit gets messed up heavily.
*/

line_width[0] = 0; // Now initialized in the page loop initializer in draw
//final_textbox_width[page] - (text_border * 2) + 1;

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_speed = 1;
text_pause_timer = 0;
text_pause_time = 0.1 * game_get_speed(gamespeed_fps); //0.1
//text_pause_mid = 0.5 * game_get_speed(gamespeed_fps);
//text_pause_long = 1 * game_get_speed(gamespeed_fps);

// Options/Choices
option[0] = "";
option_link_id = -1;
option_pos = 0;
option_number = 0;

setup = false;

speaker_name[0] = "";
textbox_type[0] = 0;
bubble_follow[0] = noone;
forced_pos[0] = 0;
value_change[0] = false;

start_page_function[0] = 0;
end_page_function[0] = 0;
drawn_text_function[0, 0] = 0;
/*
	drawn_text_function[page, amount passed] = {
		funct : _function,
		index : _string_index,
	}
*/

character_portrait[0] = 0;
/*
	character_portrait[0] = {
		sheet : 0,
		x_frame : 0,
		y_frame : 0,
		is_leftside : 0,
		bg_color : 0,
	}
*/
portrait_change[0] = false;
portrait_change_occured[0] = false;

// sound (IMPLEMENT LATER, Part 4 - 24:00)
//snd_delay = 4;
//snd_count = snd_delay;
typer_sound[0] = 0;
/*
	typer_sound[page_number] = {
		snd : _snd,
		snd_pitch : _pitch,
		pitch_variance : _variance,
		loudness : _loudness
	}
*/
typer_sound_change[0] = false;
typer_sound_change_occured[0] = false;


// effects
scr_set_defaults_for_text();
last_free_space = 0;




