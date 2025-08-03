
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

array_push(option, "PLAY"); 
array_push(option, "LEAVE");


option_number = array_length(option);
option_pos = 0;

#endregion






#region Flavor Text
flavor_text_array = 
[
	"Red & Brown",
	"Brown & Red",
	"It's me...",
	"Do you actually want this?",
	"A conglomeration of everyone who loves you.", // Quote From My Mom
	"Best Of Both Things", // Owl House Quote
];
flavor_text = flavor_text_array[irandom(array_length(flavor_text_array) - 1)];
#endregion

#region Version Data
version_data = "v0.01.00 (GMTK 2025 Version)";
/*
v0.01.00 - GMTK 2025 (August 3rd, 2025)
*/
#endregion