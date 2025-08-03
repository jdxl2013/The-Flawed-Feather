
if (can_interact) {
	image_index += calc_compare_divide(image_index, 3, 5);
} else {
	image_index += calc_compare_divide(image_index, 0, 5);
}

// Inherit the parent event
event_inherited();

