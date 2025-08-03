
/// @description	Holds all save point names for each room.
///					With how this works, multiple names for save points (in the same room) are not possible.
///					If a room isn't listed, it uses the file name for it (i.e.: "rm_...")
///					Only provide room names for places where save points are supposed to be.
/// {Asset.GMRoom}	_room	Room to get the name from. Defaults to the currently loaded room.
function get_save_point_room_names(_room = room) {
	var _str = "";
	switch (_room) {
		case rm_demo_cafehere:	_str =		"Neighborhood";				break;
		//	NBHD. – Café Here
		//	Redhood – Café		(Happens when its "the afternoon" in the area.)
		//	Neighborhood		(Current standing name, escially since there's only one save point there.)
		case rm_demo_school2:	_str =		"School – Field";			break;
		
		default:				_str =		room_get_name(room);
	}
	return _str;
}