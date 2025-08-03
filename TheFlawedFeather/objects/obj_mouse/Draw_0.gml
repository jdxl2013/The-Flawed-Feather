
var _both_capable_hover = is_capable && hovering;

var _to_col		= _both_capable_hover ? c_orange : c_dkgray;
var _main_col	= _both_capable_hover ? c_yellow : c_ltgray;
var _to_img		= _both_capable_hover ? 3 : 2;
var _main_img	= _both_capable_hover ? 1 : 0;

#region Towards Visual
if (to_angle < 360) {
	if (_both_capable_hover) {
		to_angle += 0.5;
	} else {
		to_angle += 2;
	}
} else {
	//to_angle += calc_compare_divide(to_angle, 0, 15);
	to_angle = 0;
}
#endregion


to_current_scale += calc_compare_divide(to_current_scale, to_scale, 5);

gpu_set_blendmode(bm_add);
draw_sprite_ext(
	spr_mouse, _to_img,
	x_to, y_to,
	to_current_scale, to_current_scale,
	to_angle, _to_col, image_alpha
);
#region Draw Camera
draw_sprite_ext(
	spr_mouse, _main_img,
	x, y,
	1, 1,
	0, _main_col, image_alpha
);
gpu_set_blendmode(bm_normal);
