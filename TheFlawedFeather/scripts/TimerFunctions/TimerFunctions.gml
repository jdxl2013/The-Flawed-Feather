/// @param _id
/// @description Holds all of the timer functions used. Check "TimerScripts.gml" for how these are called.
/// Needs to be a Switch Function due to saving functions in save files not being possible.
function scr_timer_functions(_id) {
	switch (_id) {
		
		#region test1
		case "test1":
			obj_player.char_var = obj_player.char_var == 0 ? 2 : 0;
			break;
		#endregion
		#region test2
		case "test2":
			obj_player.char_var = obj_player.char_var == 1 ? 3 : 1;
			break;
		#endregion
		
		default: // Do Nothing
	}
}