
function cutscene_cg_id_list(_id) {
	
	// Reset if other scenes are running.
	cg_array = array_create(0);
	current_scene_of_array = 0;
	cutscene_cg_unloop();
	cutscene_cg_unpause();
	
	#region Switch Case
	switch (_id) {
		
		#region bus_test
		case "bus_test":
			cutscene_cg_add_scene(spr_scene_bus_01, 5, 0, 1, 2.5);
			cutscene_cg_add_scene(spr_scene_bus_01, 5, 0, 40, 0.05);
			cutscene_cg_add_scene(spr_scene_bus_01, 5, 0, 1, 1);
			//cutscene_cg_add_scene(spr_scene_bus_1b_alt, 5, 0, 25, 0.05);
			cutscene_cg_add_scene(spr_scene_bus_02, 3, 0, 14, 0.2);
		break;
		#endregion
		
		default:
			// Do nothing
	}
	#endregion
	
	cutscene_cg_set_values(0);
}