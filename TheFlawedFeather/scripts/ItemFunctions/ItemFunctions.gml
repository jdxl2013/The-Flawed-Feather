/// @param _id
/// @description Holds all of the item functions used. Check global.item_list. For simplicity, advise for each id to match the item_list name.
/// Needs to be a Switch Function due to saving functions in save files not being possible.
function scr_item_functions(_id) {
	switch (_id) {
		
		#region test_item1
		case "test_item1":
			create_textbox("use_test_item_1");
			break;
		#endregion
		
		#region paper_doc
		case "paper_doc":
			array_delete(global.inventory.items, obj_item_menu.option_pos, 1);
			
			var _doc_name = struct_get_names(global.documents_list);
			_doc_name = _doc_name[irandom(struct_names_count(global.documents_list) - 1)];
			var _final_doc = global.documents_list[$ _doc_name];
			documents_add(_final_doc);
				
			create_textbox("use_paper_doc");
			break;
		#endregion
		
		#region pill_bottle
		case "pill_bottle":
			create_textbox("use_pill_bottle");
			array_delete(global.inventory.items, obj_item_menu.option_pos, 1);
			array_insert(global.inventory.items, obj_item_menu.option_pos, global.item_list.pill_bottle_empty);
			break;
		#endregion
		
		#region pill_bottle_empty
		case "pill_bottle_empty":
			var _pill_bottle_rng = irandom(1);
			
			if (_pill_bottle_rng == 0) {
				create_textbox("use_pill_bottle_emptyA");
				array_delete(global.inventory.items, obj_item_menu.option_pos, 1);
				array_insert(global.inventory.items, obj_item_menu.option_pos, global.item_list.pill_bottle);
					
			} else {
				create_textbox("use_pill_bottle_emptyB");
				if (array_length(global.inventory.items) != 0) {
					array_delete(global.inventory.items, obj_item_menu.option_pos, 1);
					if (obj_item_menu.option_pos == array_length(global.inventory.items)) obj_item_menu.option_pos -= 1;
				}
			}
			break;
		#endregion
		
		#region file_doc
		case "file_doc":
			var _doc_name = struct_get_names(global.documents_list);
			_doc_name = _doc_name[irandom(struct_names_count(global.documents_list) - 1)];
			var _final_doc = global.documents_list[$ _doc_name];
			documents_add(_final_doc);
				
			create_textbox("use_file_doc");
			break;
		#endregion
		
		#region flute
		case "flute":
			// Play Flute Sound
			
			// Unlock Flute Related Stuff
			if (instance_exists(obj_flute_door)) {
				with (obj_flute_door) {
					if (command != "warp") {
						command = "warp";
						create_textbox("use_flute_text");
					}
				}
			}
		break;
		#endregion
		
		default: create_textbox("item_no_use"); // Do Nothing
	}
}