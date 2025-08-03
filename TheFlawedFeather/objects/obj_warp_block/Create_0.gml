/// @description Initialize which room and where the player will spawn in said room.

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
