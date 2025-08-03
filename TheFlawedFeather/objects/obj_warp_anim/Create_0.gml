
image_alpha = 0;

#region Important Warp Variables
// Room Goto
target_room = 0;

// Player Location
target_x = 0;
target_y = 0;
target_dir = 0;
//		1				Facing Right		[-->]
//		-1				Facing Left			[<--]
//		0 or other		Current Direction

instant_warp = false; // Skip the warp animation.

warp_script_ids = ""; // Warp IDs
#endregion

fade_spd = 0.1; // 0.05 or 0.01 for testing, 0.1 is normal
	
pause_timer = 0;
pause_time = 0.15 * game_get_speed(gamespeed_fps);

has_warped = false;
