/// @description Insert description here
// You can write your code in this editor

surface_mirror = -1;
surface_width = abs(bbox_left - bbox_right);
surface_height = abs(bbox_top - bbox_bottom);

surface_resize(application_surface, CAMERA_WIDTH, CAMERA_HEIGHT);

camera = view_camera[0];