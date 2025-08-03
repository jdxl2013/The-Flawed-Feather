
setup = false;

accept_key = 0;
cancel_key = 0;

#region GENERAL INIT
depth = -999;
box_alpha = 1;
text_alpha = 1;
// 0.5, 0.9, 1
// Check the Creation Anim for init values

logo_anim = 0;
// Animations
anim_x_offset = 0;
anim_y_offset = 0;
delete_anim = false;
create_anim = true; // only meant to happen once
next_anim = false;
prev_anim = false;

is_starting_game = false;
logo_alpha = 0.5;
not_logo_alpha = 1;

// Set to the camera
textbox_x = 0;
textbox_y = 0;

textbox_main_pos = true;

textbox_width = 128;
textbox_height = 47;

box_spr = spr_textbox;
box_img = 0;
box_spd = 0;
box_spr_width = sprite_get_width(box_spr);
box_spr_height = sprite_get_height(box_spr);
#endregion

#region Options/Choices

option = array_create(0);
// Main Title Screen
//option[0] = "CONTINUE"; // have it change to say continue when you have more than 0 saves
array_push(option, "PLAY"); //debate on changing to ADMIT like in medical.
if (check_if_save_data_exists()) array_push(option, "CONTINUE");
if (global.debug.is_enabled) array_push(option, "SETTINGS");
if (global.debug.is_enabled) array_push(option, "ACHIEVEMENTS"); // not sure
if (global.debug.is_enabled) array_push(option, "CREDITS");
array_push(option, "LEAVE");

// Settings
//option[1, 0] = "CONTROLS";
//option[1, 1] = "LANGUAGE";
//option[1, 2] = "VIDEO";
//option[1, 3] = "AUDIO";
//option[1, 4] = "RETURN";

option_number = array_length(option);
option_pos = 0;

#endregion






#region Flavor Text
flavor_text_array = 
[
	"OUTPATIENT",
	//"MALADE EN CONSULTATION EXTERNE",
	//"PATIENTE EXTERNO",
	//"WHERE THE HECK AM I???",
	"DREAM 182–B",
	//"Game where you you go you you you uh... me, no wait... what",
	//"Costel, I don't think we need flavor text lol",
	"Flavor text :>",
	
	// 4/24/2025
	"November 2nd, 2023",
	"Orange",
	"Pushing Into The Kaleidoscope",
	"Don't you want to be HAPPY?",
	"i'm afraid",
	"Rianne – Sheep",
	"Costel – Dragon",
	"Beckett – Horse",
];
flavor_text = flavor_text_array[irandom(array_length(flavor_text_array) - 1)];
if (!check_if_save_data_exists()) flavor_text = "";
#endregion

#region Version Data
version_data = "OUTPATIENT v0.01.00";
//version_data += "\njdxl2013 2023-2025";
//GM_version; Might actively forget this existing unless needed for like standard practice or something lol
/*
v0.00.00 - Showcase Demo (v20250502) (2025/05/02)
v0.01.00 - Devlog 8 Update
*/
#endregion