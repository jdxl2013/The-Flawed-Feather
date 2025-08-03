/// @param _id
/// @description Holds all of the collide block functions used. Check "obj_collide_cmd_block".
/// Needs to be a Switch Function due to saving functions in save files not being possible.
function scr_collide_block_functions(_id) {
	switch (_id) {
		
		#region TESTING
		#region test
		case "test":
			obj_player.char_var = obj_player.char_var == 0 ? 2 : 0;
			break;
		#endregion
		#region bus_test
		case "bus_test":
			spawn_bus(x + 300, y + 32, 15, 5);
			break;
		#endregion
		#endregion
		
		#region DEMO
		#region demo_bus
		case "demo_bus":
			spawn_bus(x + 16, y + 32, 5, 5);
			break;
		#endregion
		#region demo_final_scene
		case "demo_final_scene":
			create_textbox("demo_creature_scene_final");
			break;
		#endregion
		#endregion
		
		default: // Do Nothing
			drt_scr_collide_block_functions(_id);
	}
}