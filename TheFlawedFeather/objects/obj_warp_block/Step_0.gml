visible = global.debug.is_enabled ? true : false;

if (place_meeting(x, y, obj_player) && !instance_exists(obj_warp_anim)) {
	
	warp_player(target_room, target_x, target_y, target_dir, instant_warp, warp_script_ids);
	//var _inst = instance_create_depth(0, 0, -9999, obj_warp_anim);
	//_inst.target_room = target_room;
	//_inst.target_x = target_x;
	//_inst.target_y = target_y;
	//_inst.target_dir = target_dir;
}