if (global.flag[1] == true) { // Flag for if you have encountered the creature.
	interaction_is_available = true;
	image_index = 1;
} else {
	interaction_is_available = false;
	image_index = 0;
}

// Inherit the parent event
event_inherited();

