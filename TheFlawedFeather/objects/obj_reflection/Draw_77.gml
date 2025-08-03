/// @description Insert description here
// tried this again, it still didnt work, aaaaa, come back to this later

if (surface_exists(surface_mirror) == false) {
	surface_mirror = surface_create(surface_width, surface_height);
}

var _xpos = camera_get_view_x(camera);
var _ypos = camera_get_view_y(camera);

surface_copy_part(
	surface_mirror, 0, 0,
	application_surface, x - _xpos, y - _ypos,
	surface_width, surface_height);

surface_set_target(surface_mirror);
	draw_set_color(c_aqua);
	draw_set_alpha(0.5);
	draw_rectangle(
		0, surface_height,  // 0, 0
		surface_width, surface_height - 64,
		false);
surface_reset_target();

draw_set_color(c_white);
draw_set_alpha(1);

draw_surface_ext(
	surface_mirror,
	x, y + (surface_height * 2),
	1, -1,
	0, c_white, 0.9);


