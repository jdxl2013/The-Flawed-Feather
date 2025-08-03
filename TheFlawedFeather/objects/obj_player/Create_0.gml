
key_left = 0;
key_right = 0;
key_run = 0;

/// @description Player Create
x_speed = 0;
y_speed = 0;

move_speed = 0;
// Movement Speeds
walk_speed = 1;
run_speed = 2;

grav = 0.1;
// There's no jump mechanic but this is to just keep the player on the ground.

x_offset = 16;
y_offset = 32;
frame_size = 32;
anim_state = 0;

x_frame = 0;
y_frame = 0;
anim_length = 8;
anim_speed = 0;
// Animation Speeds Per Each Second
anim_walk = 0.135;
anim_run = 0.08;

// Character Playing As
char_name = "";
current_char_sheet = 0;
char_eye_glow = 0;
char_bandana = 0;
char_bandana_alpha = 0;
char_var = global.player.char.val; //currently initialized in obj_saveload
handle_character(char_var);
char_eye_alpha = 1;
char_brightness = c_white;
char_reflection_alpha = 0; // default is 0.5
//current_char_sheet = CostelA_Sheet;

state = PLAYERSTATE.FREE;

enum PLAYERSTATE {
	FREE
}