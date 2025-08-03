visible = global.debug.is_enabled ? true : false;

if (follow != noone && instance_exists(follow)) {
	x_target = follow.x;
	y_target = follow.y;
}
if (update_follow_x) x_goto = x_target;
if (update_follow_y) y_goto = y_target;

if (
	instance_exists(obj_player)
	&& place_meeting(x, y, obj_player)
) {
	has_player_collide = true;
} else {
	has_player_collide = false;
}