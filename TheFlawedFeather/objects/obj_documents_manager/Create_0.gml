
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
		case "cyan":
			col_new = $FFFF00; col_seen = $FFFFD0; break;
		case "freedom": // Redish-Majenta
			col_new = $4800FF; col_seen = $A480FF; break;
		case "magenta":
			col_new = $FF00FF; col_seen = $FF80FF; break;
		case "hell": // Red
			col_new = $0000E6; col_seen = $8080F3; break;
		case "outpatient": // Orange
			col_new = $3149E1; col_seen = $98A4F0; break;
		case "da_gang": // Green
			col_new = $00FF00; col_seen = $80FF80; break;
		case "hide": // Black & Gray
			col_new = $000000; col_seen = $404040; break;
		case "debut_green1":
			col_new = $737300; col_seen = $BFBF00; break;
		case "debut_green2":
			col_new = $BFBF00; col_seen = $DFDF80; break;
		case "debut_pink":
			col_new = $8C8CFF; col_seen = $C9D3FF; break;
		case "grayscale":
			col_new = $717171; col_seen = $AAAAAA; break;
	}
	/* COLORS
					NEW			SEEN
	YELLOW			$00FFFF		$80FFFF
	CYAN			$FFFF00		$FFFFD0
	FREEDOM			$4800FF		$A480FF
	MAGENTA			$FF00FF		$FF80FF
	HELL			$0000E6		$8080F3
	OUTPATIENT		$3149E1		$98A4F0
	DA GANG			$00FF00		$80FF80
	HIDE			$000000		$404040
	DEBUT_GREEN1	$737300		$BFBF00
	DEBUT_GREEN2	$BFBF00		$DFDF80
	DEBUT_PINK		$8C8CFF		$C9D3FF
	GRAYSCALE		$717171		$AAAAAA
	*/
	#endregion
	
	time_created = 0; // Handle with the save file time.
};


global.documents_list = {
	
	#region Test Documents
	//	"12345678901234567890"
	test_doc_lineAmt : new create_document(
		"[T] Line Amount",
		"test_sign2 - document - Line_Amount"
	),
	test_doc_charAmt : new create_document(
		"[T] Character Width",
		"test_sign2 - document - Character_Width",
	),
	test_doc_choiceAmt : new create_document(
		"[T] Choice Amount",
		"test_sign2 - document - Choice_Amount"
	),
	test_doc_nameSize : new create_document(
		"[T] Name Width",
		"test_sign2 - document - Name_Width"
	),
	test_doc_textSpam : new create_document(
		"[T] Text Spam",
		"test_sign2 - document - Text_Spam",
	),
	test_doc_pageAmt : new create_document(
		"[T] Page Amount",
		"test_sign2 - document - Page_Amount",
	),
	test_doc_fonts : new create_document(
		"[T] Font Tester",
		"test_sign2 - document - Font_Tester",
	),
	test_doc_dream1 : new create_document(
		"[T] Dream 182-C XRP.",
		"test_sign3 - Dream_Read",
		"outpatient"
	),
	test_doc_dream2 : new create_document(
		"[T] Dream 182-C RED.",
		"test_sign3 - Dream_Read_Redacted",
		"outpatient"
	),
	#endregion
}


//for (var i = 0; i < 3; i++) {
	documents_add(global.documents_list.test_doc_lineAmt);
	documents_add(global.documents_list.test_doc_charAmt);
	documents_add(global.documents_list.test_doc_choiceAmt);
	documents_add(global.documents_list.test_doc_nameSize);
	documents_add(global.documents_list.test_doc_textSpam);

	documents_add(global.documents_list.test_doc_pageAmt);
	documents_add(global.documents_list.test_doc_fonts);
	documents_add(global.documents_list.test_doc_dream1);
	documents_add(global.documents_list.test_doc_dream2);
//}


