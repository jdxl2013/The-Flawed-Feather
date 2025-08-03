
// DOCUMENTS

function create_document(_name, _text_id, _color = "yellow") constructor {
	name = _name; // MUST BE LESS THAN 20 CHARACTERS
	text_id = _text_id;
	
	#region Read Status
	read_status = 0;
	/*
		0	NEW
		1	SEEN
			Just a means of checking if you've looked at it or not (for the menu looks of it).
		2	READ
			Need to go to the last page to count.
	*/
	#endregion
	
	#region Color Stuffs
	color = _color;
	col_new = 0;
	col_seen = 0;
	switch (color) {
		case "yellow":
			col_new = $00FFFF; col_seen = $80FFFF; break;
	}
	/* COLORS
					NEW			SEEN
	YELLOW			$00FFFF		$80FFFF
	*/
	#endregion
	
	time_created = 0; // Handle with the save file time.
};


global.documents_list = {
	
	#region Test Documents
	//	"12345678901234567890"
	doc_controls : new create_document(
		"Controls",
		"teach - controls"
	),
	doc_how_play : new create_document(
		"How To Play",
		"teach - how_play"
	),
	doc_credits : new create_document(
		"Credits",
		"teach - credits"
	),
	
	#endregion
}





