

#region INTERACTION ATTRIBUTES
can_interact = false;
radius = 16;
#endregion

#region POPUP STUFFS
// this creates a popup for every object, id rather it would create it when you are able
// to make it and destroys when you cant to be more optimized, figure out later.
//popup = instance_create_layer(x - 0.5, bbox_top, layer, obj_popup);

popup_alpha = 0;
popup_y_offset = 1;
popup_index = 0;
#endregion

#region INTERACTION COMMANDS
/*
	unless if i could make it so a command can be set in the create event,
	i have to settle with a switch statement, doing a switch statement also
	helps incase i need to add any new commands for interactions.
*/
command = 0;
//command = create_textbox(text_id);
/*
	INT	STR		COMMAND			SCRIPT
	0	0		Does Nothing	--- (Useful for the custom code via scr_interaction_function.)
	1	text	Textbox			create_textbox(text_id);
	2	warp*	Warp			warp_player(target_room, target_x, target_y, target_dir, instant_warp, warp_script_ids);
	3	item	Item Pick Up	item_add(item)
	4	save	Save Point		(!needs implementation)
	
	*	If you have a locked door or something that could be unlocked, use the textbox.
*/
interaction_script_id = 0;

#region	1	text	Textbox			create_textbox(text_id);
text_id = "";
#endregion
#region	2	warp	Warp			warp_player(target_room, target_x, target_y, target_dir, instant_warp, warp_script_ids);
// Room Goto
target_room = 0;
// Player Location
target_x = 0;
target_y = 0;
target_dir = 0;
//		1				Facing Right		[-->]
//		-1				Facing Left			[<--]
//		0 or other		Current Direction
instant_warp = false; // Skip the warp animation.
warp_script_ids = ""; // Warp IDs
#endregion
#region	3	item	Item Pick Up	item_add(item)
item = 0;
//		= global.item_list.[insert item];
#endregion

#region 4	save	Open Save File
///////////////
#endregion

#region Interaction Counts
interaction_amt = 1; // 1 by default.
current_interaction = 1; // 1 by default, do not alter unless otherwise.
// Amount of times you can interact for the sake of multiple textboxes in the same object.
interaction_is_available = true;

interaction_type = 0;
/*
	INT	STR		DESCRIPTION
	0	0		Continuous interaction. Let's you keep on interacting with something like normal.
					This basically does nothing.
	1	hold*	Continuous interaction but holds on the final action amount.
	2	rng*	Continuous interaction but randomizes for each possible action.
	3	end		After interacting or after finishing the actions number, you can no longer interact.
	
	*	HOLD and RNG work in the case that you have several action amounts.
		If you have only 1 interaction, then this becomes the loop.
*/
if (interaction_amt == 1 && (interaction_type == 1 || interaction_type == 2)) interaction_type = 0;
#endregion

#endregion

#region ANIMATION STUFFS

object_x_offset = 0;
object_y_offset = 0;
pickup_anim = false;
object_alpha = 1;

#endregion

#region Save Data
// Save Room Data Stuff - False by default.
data_will_save = false;
save_data = {
	data_will_save : data_will_save,
	
	x : x,
	y : y,
	
	sprite_index : sprite_index,
	image_index : image_index,
	image_speed : image_speed,
	
	image_xscale : image_xscale,
	image_yscale : image_yscale,
	image_blend : image_blend,
	image_angle : image_angle,
	
	object_index : object_index,
	layer : layer,
	
	can_interact : can_interact,
	interaction_amt : interaction_amt,
	current_interaction : current_interaction,
	interaction_is_available : interaction_is_available,
	interaction_type : interaction_type,
	
	command : command,
	
	text_id : text_id,
	
	target_room : target_room,
	target_x : target_x,
	target_y : target_y,
	target_dir : target_dir,
	
	interaction_script_id : interaction_script_id,
	warp_script_ids : warp_script_ids,
	instant_warp : instant_warp,
	
	item : item
}
#endregion