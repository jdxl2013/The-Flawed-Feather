
#region SET WINDOW SIZE
// Likely move this into a different object
// when you get settings in.
window_set_size(
	WINDOW_WIDTH * WINDOW_SCALE,
	WINDOW_HEIGHT * WINDOW_SCALE);
view_wport[0] = CAMERA_WIDTH;
view_hport[0] = CAMERA_HEIGHT;
if (!window_get_fullscreen()) window_center();
#endregion

cam_width = CAMERA_WIDTH;
cam_height = CAMERA_HEIGHT;

setup = true;

follow = noone;
	
//cam_x_offset = 0; // just in case
//cam_y_offset = -16;
//x = follow.x + cam_x_offset;
//y = follow.y + cam_y_offset;


cam_x_offset = 0;
cam_y_offset = 0;
//x = room_width / 2;
//y = room_height / 2;
x = 0;
y = 0;

can_look_around = false;

cam_height_align = 0;
cam_height_value = 0;
cam_height_multiple = 4; // 0.01, [4], 32, 48, 64
cam_clamp_value = 16; //32; //16;
/*	The clamp and multiple values multiply to how far the player can see up and down.
	It's preferable to have it multiply to 64.
	The multiple will dictate how fast it moves.
	I kinda like the following comination:
		Multiple * Clamp
		4 * 16
		5 * 100  (for testing)
*/


cam_x_smooth = 10; //Higher value, slower it aligns.
cam_y_smooth = 10;

current_x_smooth = cam_x_smooth; // Smoothing the camera smooth.
current_y_smooth = cam_y_smooth;

x_to = x;
y_to = y;

depth = -9999;
image_alpha = 0;