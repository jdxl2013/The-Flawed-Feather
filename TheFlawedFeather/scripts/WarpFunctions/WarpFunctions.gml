/// @param _id
/// @description Holds all of the warp functions used. Check obj_interaction or obj_warp_anim.
/// These run on warp.
/// Needs to be a Switch Function due to saving functions in save files not being possible.
function scr_warp_functions(_id) {
	switch (_id) {
		
		#region LOAD_GAME
		case "LOAD_GAME":
			if (instance_exists(obj_player)) {
				obj_player.char_var = global.player.char.val;
			}
			load_room();
			break;
		#endregion
		
		#region
		case "test_warp_function":
			//add_timer("test1", irandom_range(500, 1000), 0, 1, 2);
			//add_timer("test2", 300, 1, 2, false);
			
			//obj_player.char_var = 2;
			//create_textbox("test_sign1 - Rianne Lore 2");
			//create_textbox("test_sign1");
			create_textbox("test_sign5");
			break;
		#endregion
		
		default: // Do nothing.
	}
}