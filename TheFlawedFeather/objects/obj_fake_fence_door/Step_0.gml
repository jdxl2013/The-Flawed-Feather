if (global.flag[1]) {
	command = "warp";
	// SET UP THE WARP
	target_room = rm_demo_school2;
	target_x = 8;
	target_y = 256;
	target_dir = 1;
	
	warp_script_ids = "demo_creature_cutscene2";
	
	image_index = 1;
	
} else {
	command = "text";
	text_id = "demo_fake_fence";
	
	image_index = 0;
}

// Inherit the parent event
event_inherited();

