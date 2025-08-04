
get_controls();








confirm_key = mouse_check_button(mb_left);
confirm_key_pressed = mouse_check_button_pressed(mb_left);
confirm_key_released = mouse_check_button_released(mb_left);
cancel_key = mouse_check_button_pressed(mb_right);



// Use CONFIRM to choose the action.
// Use CANCEL to toggle the action.

#region MOVEMENT
x += calc_compare_divide(x, mouse_x, 2);
y += calc_compare_divide(y, mouse_y, 2);
#endregion



#region CHECK FOR OBJECT
coll_obj = collision_point(x, y, obj_interaction, 0, 1);



if (coll_obj != noone) {
	hovering = true;
} else {
	hovering = false;
	
	x_to += calc_compare_divide(x_to, x, 10);
	y_to += calc_compare_divide(y_to, y, 10);
	to_scale = 1;
}


#endregion

#region DO MOUSE ACTIONS
if (hovering) {
	if (coll_obj.can_interact) { // TOGGLE (Buttons And What Not)
		is_capable = true;
		
		
		var _width = coll_obj.bbox_right - coll_obj.bbox_left;
		var _height = coll_obj.bbox_bottom - coll_obj.bbox_top;
		
		var _center_x = coll_obj.x;
		var _center_y = coll_obj.y - (_height / 2);
		
		x_to += calc_compare_divide(x_to, _center_x, 5);
		y_to += calc_compare_divide(y_to, _center_y, 5);
		
		to_scale = ((_width + _height) / 2) / 32;
	} else {
		is_capable = false;
		
		x_to += calc_compare_divide(x_to, x, 10);
		y_to += calc_compare_divide(y_to, y, 10);
		to_scale = 1;
	}
}
#endregion

// Offset From Camera
x_offset = x - obj_camera.x;
y_offset = y - obj_camera.y;
x_to_offset = x_to - obj_camera.x;
y_to_offset = y_to - obj_camera.y;
