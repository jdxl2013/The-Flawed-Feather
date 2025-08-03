
#region ITEMS
// Constructor
/// @param {String} _name <Item name.>
/// @param {String} _desc <Description.>
/// @param {Asset.GMSprite} _icon_spr
/// @param {Real} _icon_index
/// @param {Asset.GMSprite} _inv_spr
/// @param {Real} _inv_index
/// @param {String,Real} [_effect_id] <String for the ID called in scr_item_functions. Keep this the same as the value name.>
function create_item(_name, _desc, _icon_spr, _icon_index, _inv_spr, _inv_index, _effect_id = 0) constructor {
	// Bio
	name = _name;
	description = _desc;
	
	// Used for the menu icons or in use (small white sprite) (not implemented)
	icon_spr = _icon_spr;
	icon_index = _icon_index;
	
	// Used for the menu sprites (detailed image)
	inv_spr = _inv_spr;
	inv_index = _inv_index;
	
	//is_animated = _is_animated //case for if I want something to be animated while in the inventory.
	
	// Used for the USE option for what you want to do with the item.
	effect_id = _effect_id;
	
	// 1/13/2025: gonna try fixing the issue I've had regarding effects just constantly being used.
	effect_action_used = false;
}

// Item list
global.item_list = {
	
	#region TEST ITEMS
	#region test_item1
	test_item1 : new create_item(
			"Test Item 1",
			"Some sort of object, I don't think it has any other purpose other than just holding it.",
			//"1\n2\n3\n4\n5\n6\n7\n8",
			spr_item_icons, 1,
			spr_items, 0,
			"test_item1"),
	#endregion
	#region test_item2
	test_item2 : new create_item(
			"Test Item 2",
			"...where are all of these \"test item\" rocks coming from??",
			//"123456789A123456789B123456789C123456789D123456789E",
			spr_item_icons, 2,
			spr_items, 1,
			""),
	#endregion
	#endregion
	
	#region PLACEHOLDER ITEMS (for the September Test Footage Vid, will update them later)
	
	#region Paper Documents
	paper_doc : new create_item(
			"Paper Documents",
			"A few papers on some various assortments of information.",
			spr_item_icons, 3,
			spr_items, 2,
			"paper_doc"),
	#endregion
	#region Headphones
	headphones : new create_item(
			"Headphones",
			"These are my headphones. Not quite sure why these were in the vending machine....",
			spr_item_icons, 4,
			spr_items, 3,
			0),
	#endregion
	#region Scalpel
	scalpel : new create_item(
			"Scalpel",
			"A medic's knife. I've seen Rianne with one of these before.",
			spr_item_icons, 5,
			spr_items, 7,
			0),
	#endregion
	#region Sword
	sword : new create_item(
			"Sword",
			"It's an excalibur, branded with a golden sigil.... Its blade is of a dark metal alloy... I'm not sure what metals could have been used.",
			spr_item_icons, 6,
			spr_items, 8,
			0),
	#endregion
	#region Med-Kit
	medkit : new create_item(
			"First Aid Kit",
			"A medical kit for all of your scrapes, scratches, scars, and other medical needs. Perfect for immediate access in case of emergency.",
			spr_item_icons, 7,
			spr_items, 12,
			0),
	#endregion
	#region Rianne's Bandana
	bandana : new create_item(
			"Rianne's Bandana",
			"An orange and green checkered bandana. Rianne hasn't worn this much as of late....",
			spr_item_icons, 9,
			spr_items, 6,
			0),
	#endregion
	#region Rianne's Earring
	earring : new create_item(
			"Rianne's Earring",
			"A golden hoop earring.\n.....",
			spr_item_icons, 13,
			spr_items, 4,
			0),
	#endregion
	#region Golden Necklaces
	gold_necklaces : new create_item(
			"Golden Necklaces",
			"I never really understood the appeal of wearing jewelry – sure, they look cool, but I'm not really one to actively wear or get any myself.",
			spr_item_icons, 35,
			spr_items, 5,
			0),
	#endregion
	#region Pill Bottle
	pill_bottle : new create_item(
			"Pill Bottle",
			"A prescribed bottle of pills.",
			spr_item_icons, 29,
			spr_items, 10,
			"pill_bottle"),
	#endregion
	#region Pill Bottle (Empty)
	pill_bottle_empty : new create_item(
			"Empty Pill Bottle",
			"An empty pill bottle.",
			spr_item_icons, 30,
			spr_items, 11,
			"pill_bottle_empty"),
	#endregion
	#region Document Files
	file_doc : new create_item(
			"Document Files",
			"A bunch of documents, all grouped up into a folder.",
			spr_item_icons, 31,
			spr_items, 9,
			"file_doc"),
	#endregion
	
	
	#endregion

	#region DEMO ITEMS
	#region flute
	flute : new create_item(
			"Flute",
			"A classic concert flute for a flutist like me.",
			spr_item_icons, 47,
			spr_items, 13,
			"flute"),
	#endregion
	#region gate_key
	gate_key : new create_item(
			"Gate Key",
			"This could obviously open up a large gate somewhere.",
			spr_item_icons, 23,
			spr_items, 14,
			0),
	#endregion
	#endregion
}

// INVENTORY

//inv = array_create(0);

	//array_push(inv, global.item_list.test_item2);
	//array_push(inv, global.item_list.test_item1);
#endregion

/*
	item_add(global.item_list.test_item1);
	item_add(global.item_list.test_item2);
	
	item_add(global.item_list.paper_doc);
	item_add(global.item_list.headphones);
	item_add(global.item_list.scalpel);
	item_add(global.item_list.sword);
	item_add(global.item_list.medkit);
	item_add(global.item_list.bandana);
	item_add(global.item_list.earring);
	item_add(global.item_list.gold_necklaces);
	item_add(global.item_list.pill_bottle);
	item_add(global.item_list.file_doc);
*/	
	item_add(global.item_list.flute);
	item_add(global.item_list.gate_key);
