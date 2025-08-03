/// @param _text_id
/// @description Holds all of the text for the game.
function scr_game_text(_text_id) {
	
	switch(_text_id) {
		
		
		
		
		#region INFO
		/*
		
		The _text_id aligns to its corresponding object's Creation Code.
		ID is initialized in each individual object using:
			text_id = "_text_id";
		
		
		---TEMPLATE---
		 
		case "":
			scr_text("");
			break;
			
			scr_option("",		"");
			case "":
				scr_text("");
				break;
		
		---OTHER INFO---
		If you want to import another text id into the main text, such as menu stuff, call scr_game_text(""); again.
		*/
		
		//ENDS THE SCRIPT FOR OPTIONS WHEN CALLED
		case "END":
			instance_destroy();
			break;
		#endregion
		
		#region *** ALL TESTING SCRIPTS ***
		
		#region GENERAL TESTING 1 - Rianne Testing Lore
		
		// First sign text I've made for testing, might turn it into silly lore for this in the devlog videos.
		#region Lore 1
		case "test_sign1":
			scr_text("Hey, Costel, I became a sign of text.");
			scr_text_values("Rianne Note");
			scr_text("Kidding, I wrote this because someone said they needed to \"test the textbox code\"...");
			scr_text("...Whatever that's supposed to mean.");
			break;
		#endregion
		#region Lore 2
		case "test_sign1 - Rianne Lore 2":
			scr_text_values("Rianne Note");
			scr_text("Hey, Costel. It's me again.");
			scr_text("This place is... strange to say the least.");
			scr_text("Hopefully you're finding these notes I'm leaving around. I'll try finding you soon.");
			break;
		#endregion
		#region Lore 3 // Testing Character Portraits (Basic)
		case "test_sign1 - Rianne Lore 3":
			scr_text_values("Rianne Note");
			scr_text("Hey, Costel. Wanted to tell you something...");
			scr_text("If you happen to run into someone with a mask that looks like :) ...");
			scr_text("Run away from them, they're not real. You don't need what they're offering.");
			scr_text("Trust me on that.");
			
			// Ok so let me get this straight CopyPasta.
			scr_text_values("Costel", 1, obj_player, 1);
			scr_set_portrait(spr_portrait_costelA, 0, 0);
			scr_text("...");
			scr_text("Okay...");
			
			scr_set_portrait(spr_portrait_costelA, 12, 0);
			scr_text("So let me get this straight-");
			scr_set_portrait(spr_portrait_costelA, 8, 0);
			scr_text("I'm somewhere that's NOT what I would call Earth...");
			scr_set_portrait(spr_portrait_costelA, 2, 0);
			scr_text("Or atleast not real life...?");
			scr_text("A dream perhaps?");
			scr_set_portrait(spr_portrait_costelA, 1, 0);
			scr_text("There's a smiling mask guy, and...");
			scr_set_portrait(spr_portrait_costelA, 0, 1);
			scr_text("Oh yeah, Rianne is apparently just SOMEWHERE??");
			scr_set_portrait(spr_portrait_costelA, 7, 1);
			scr_text("I'm exploring peoples dreams...");
			scr_text("Yeah, okay, thats something I do now.");
			scr_set_portrait(spr_portrait_costelA, 2, 0);
			scr_text("I'm helping people, I do impossible stuff...");
			scr_set_portrait(spr_portrait_costelA, 0, 0);
			scr_text("Who knows... I'll probably fly next.");
			scr_text(".....");
			scr_set_portrait(spr_portrait_costelA, 3, 2);
			scr_text("Honestly, flying sounds pretty cool right about now.");
			
			scr_clear_portrait();
			scr_text("Buffer to clear portrait.");
			
			scr_text_values("?????", 1, obj_player, 1);
			scr_set_portrait(spr_portrait_creature, 2, 1, false, c_white);
			scr_text("Don't you want\nto be\nHAPPY?");
			
			scr_text_values("Costel", 1, obj_player, 1);
			scr_set_portrait(spr_portrait_costelB, 5, 2, true, c_red);
			scr_text("amongus");
			break;
		#endregion
		
		#endregion
		
		#region GENERAL SIZE & TEXTBOX TESTING
		
		#region Info
			//Amount of lines to test how much can fit in a single textbox/page.
			
			#region Initial
			/*
									LINES		CHARS.		TOTAL AMT.
			
			
			1	Textbubble			3			15			45
				Bubble(ALT1)*		3			20			60
				Bubble(ALT2)		4			20			80
				Bubble(ALT3)		3			25			75
			
			2	Document			20			25			500
				Doc(WindowSize)*	19			25			475
				
			3	Cinematic			6			61			366
			*/
			#endregion
			
			#region Line Separations (Excluding Box Adjusts)
			/*
			X	8 Height		X			X			X
				10 PartlyInBox	X			X			X
				10 FullyInBox	X			X			X
			
								LINES		CHARS.		TOTAL AMT.
			0	Screen Box		5			35			175
								5			35			175
								4			35			140
			
			1	Bubble			3			20			60
								3			20			60
								3			20			60
			
			2	Document		19			25			475
								16			25			400
								16			25			400
				
			3	Cinematic		6			61			366
								5			61			306
								5			61			305
			
			I really don't like the drop off in the character limits for this,
			I would need to increase the char width but I don't think it would do much to compensate.
			Reverting back to line width 8 and will just mark off as not planned unless asked.
			*/
			#endregion
		/*
			Also amount of characters that can fit in 1 line total.
			
			Bubble Alts.
				Chance That I increase the size slightly.
				I preferably don't want to push over 3 lines.
				I'm swapping to alt 1 for now.
			Document Window Size
				This is due to the window size resulting in 19 lines only.
		*/
		#endregion
		
		#region test_sign2 - textbox
		case "test_sign2 - textbox":
			#region MAIN
			scr_text("What would you like to test out?",
						"Testing: Textbox");
				scr_option("Line Amount",								"test_sign2 - textbox - Line_Amount");
				scr_option("Character Width",							"test_sign2 - textbox - Character_Width");
				scr_option("Choice Amount",								"test_sign2 - textbox - Choice_Amount");
				scr_option("Name Width",								"test_sign2 - textbox - Name_Width");
				scr_option("Text Spam",									"test_sign2 - textbox - Text_Spam");
				scr_option("Choice Heights (Textbox Only)",				"test_sign2 - textbox - Choice_Heights");
				scr_option("Force Position",							"test_sign2 - textbox - Force_Position");
				scr_option("<Next: Textbubble>",						"test_sign2 - textbubble");
				scr_option("<Leave>",									"END");
			break;
			#endregion
			#region LINE AMOUNT
			case "test_sign2 - textbox - Line_Amount":
				scr_text("Line_1_(30_Total_Lines_Here)\nLine 2\nLine 3\nLine 4\nLine 5\nLine 6\nLine 7\nLine 8\nLine 9\nLine 10\n" +
						 "Line 11\nLine 12\nLine 13\nLine 14\nLine 15\nLine 16\nLine 17\nLine 18\nLine 19\nLine 20\n" +
						 "Line 21\nLine 22\nLine 23\nLine 24\nLine 25\nLine 26\nLine 27\nLine 28\nLine 29\nLine 30\n");
				scr_game_text("test_sign2 - textbox");
				break;
			#endregion
			#region CHARACTER WIDTH
			case "test_sign2 - textbox - Character_Width":
				scr_text("123456789A123456789B123456789C123456789D123456789E\n" +
						 "Above line is 50 characters total.\n" +
						 "* * * * * * * * * * * * * * * * * * * * * * * * * *\n" +
						 "Above * is 50 total characters, including spaces.");
				scr_game_text("test_sign2 - textbox");
				break;
			#endregion
			#region CHOICE AMOUNT
			case "test_sign2 - textbox - Choice_Amount":
				scr_text("Testing Choice Amount\n" +
						 "All of these close the box.\n" +
						 "There's 15 total here");
					scr_option("1",		"END");
					scr_option("2",		"END");
					scr_option("3",		"END");
					scr_option("4",		"END");
					scr_option("5",		"END");
					scr_option("6",		"END");
					scr_option("7",		"END");
					scr_option("8",		"END");
					scr_option("9",		"END");
					scr_option("10",	"END");
					scr_option("11",	"END");
					scr_option("12",	"END");
					scr_option("13",	"END");
					scr_option("14",	"END");
					scr_option("15",	"END");
				break;
			#endregion
			#region NAME WIDTH
			case "test_sign2 - textbox - Name_Width":
				scr_text("Long name go", "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
				scr_text("50 Characters", "123456789A123456789B123456789C123456789D123456789E");
				scr_game_text("test_sign2 - textbox");
				break;
			#endregion
			#region TEXT SPAM
			case "test_sign2 - textbox - Text_Spam":
				scr_text("This is meant to test the text capacity to check for lag. Anyways: " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "To any lore people out there: no, this is not a cypher, i just mashed my keyboard for like 3 lines then copied lol.");
				scr_game_text("test_sign2 - textbox");
				break;
			#endregion
			#region CHOICE HEIGHTS
			case "test_sign2 - textbox - Choice_Heights":
				scr_text("Testing Choice Heights\n" +
						 "All of these close the box.\n" +
						 "Each one has differents heights, some are the same.");
					scr_option("1 Line",						"END");
					scr_option("2 Lines\n..",					"END");
					scr_option("1 Line",						"END");
					scr_option("3 Lines\n..\n...",				"END");
					scr_option("4 Lines\n..\n...\n....",		"END");
					scr_option("2 Lines Again\n..",			"END");
				break;
			#endregion
			#region FORCE POSITION
			case "test_sign2 - textbox - Force_Position":
				scr_text("Position is automated.", "Auto", 0, noone, 0);
				scr_text("Main Position", "Main", 0, noone, 1);
				scr_text("Alternate Position", "Alt", 0, noone, 2);
				scr_game_text("test_sign2 - textbox");
				break;
			#endregion
		#endregion
		
		#region test_sign2 - textbubble
		case "test_sign2 - textbubble":
			#region MAIN
			scr_text("What would you like to test out?",
						"Testing: Textbubble", 0); // 1
				scr_option("Line Amount",									"test_sign2 - textbubble - Line_Amount");
				scr_option("Character Width",								"test_sign2 - textbubble - Character_Width");
				scr_option("Choice Amount",									"test_sign2 - textbubble - Choice_Amount");
				scr_option("Name Width",									"test_sign2 - textbubble - Name_Width");
				scr_option("Text Spam",										"test_sign2 - textbubble - Text_Spam");
				scr_option("Force Position",								"test_sign2 - textbubble - Force_Position");
				scr_option("Force Pos. Follow (Textbubble Only)",			"test_sign2 - textbubble - Force_Position_Follow");
				scr_option("<Next: Document>",								"test_sign2 - document");
				scr_option("<Leave>",										"END");
			break;
			#endregion
			#region LINE AMOUNT
			case "test_sign2 - textbubble - Line_Amount":
				scr_text("Line_1_(30_Total_Lines_Here)\nLine 2\nLine 3\nLine 4\nLine 5\nLine 6\nLine 7\nLine 8\nLine 9\nLine 10\n" +
						 "Line 11\nLine 12\nLine 13\nLine 14\nLine 15\nLine 16\nLine 17\nLine 18\nLine 19\nLine 20\n" +
						 "Line 21\nLine 22\nLine 23\nLine 24\nLine 25\nLine 26\nLine 27\nLine 28\nLine 29\nLine 30\n",
					"", 1);
				scr_game_text("test_sign2 - textbubble");
				break;
			#endregion
			#region CHARACTER WIDTH
			case "test_sign2 - textbubble - Character_Width":
				scr_text("123456789A123456789B123456789C123456789D123456789E\n" +
						 "Above line is 50 characters total.\n" +
						 "* * * * * * * * * * * * * * * * * * * * * * * * * *\n" +
						 "Above * is 50 total characters, including spaces.",
					"", 1);
				scr_game_text("test_sign2 - textbubble");
				break;
			#endregion
			#region CHOICE AMOUNT
			case "test_sign2 - textbubble - Choice_Amount":
				scr_text("Testing Choice Amount\n" +
						 "All of these close the box.\n" +
						 "There's 15 total here",
					"", 1);
					scr_option("1",		"END");
					scr_option("2",		"END");
					scr_option("3",		"END");
					scr_option("4",		"END");
					scr_option("5",		"END");
					scr_option("6",		"END");
					scr_option("7",		"END");
					scr_option("8",		"END");
					scr_option("9",		"END");
					scr_option("10",	"END");
					scr_option("11",	"END");
					scr_option("12",	"END");
					scr_option("13",	"END");
					scr_option("14",	"END");
					scr_option("15",	"END");
				break;
			#endregion
			#region NAME WIDTH
			case "test_sign2 - textbubble - Name_Width":
				scr_text("Long name go", "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", 1);
				scr_text("50 Characters", "123456789A123456789B123456789C123456789D123456789E", 1);
				scr_game_text("test_sign2 - textbubble");
				break;
			#endregion
			#region TEXT SPAM
			case "test_sign2 - textbubble - Text_Spam":
				scr_text("This is meant to test the text capacity to check for lag. Anyways: " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "To any lore people out there: no, this is not a cypher, i just mashed my keyboard for like 3 lines then copied lol.",
					"", 1);
				scr_game_text("test_sign2 - textbubble");
				break;
			#endregion
			#region FORCE POSITION
			case "test_sign2 - textbubble - Force_Position":
				scr_text("Position is automated.", "Auto", 1, noone, 0);
				scr_text("Main Position", "Main", 1, noone, 1);
				scr_text("Alternate Position", "Alt", 1, noone, 2);
				scr_game_text("test_sign2 - textbubble");
				break;
			#endregion
			#region FORCE POSITION (FOLLOW ALT)
			case "test_sign2 - textbubble - Force_Position_Follow":
				scr_text("Position is automated.", "Auto", 1, obj_player, 0);
				scr_text("Main Position", "Main", 1, obj_player, 1);
				scr_text("Alternate Position", "Alt", 1, obj_player, 2);
				scr_game_text("test_sign2 - textbubble");
				break;
			#endregion
		#endregion
		
		#region test_sign2 - document
		case "test_sign2 - document":
			#region MAIN
			scr_text("What would you like to test out?",
						"Testing: Document", 0); // set to 2 once you get options coded in ig lol
				scr_option("Line Amount",									"test_sign2 - document - Line_Amount");
				scr_option("Character Width",								"test_sign2 - document - Character_Width");
				scr_option("Choice Amount",									"test_sign2 - document - Choice_Amount");
				scr_option("Name Width",									"test_sign2 - document - Name_Width");
				scr_option("Text Spam",										"test_sign2 - document - Text_Spam");
				scr_option("Page Amount (Document Only)",					"test_sign2 - document - Page_Amount");
				scr_option("Font Tester (Document Only)",					"test_sign2 - document - Font_Tester");
				scr_option("Force Position",								"test_sign2 - document - Force_Position");
				scr_option("<Next: Cinematic>",								"test_sign2 - cinematic");
				scr_option("<Leave>",										"END");
			break;
			#endregion
			#region LINE AMOUNT
			case "test_sign2 - document - Line_Amount":
				scr_text("Line_1_(30_Total_Lines_Here)\nLine 2\nLine 3\nLine 4\nLine 5\nLine 6\nLine 7\nLine 8\nLine 9\nLine 10\n" +
						 "Line 11\nLine 12\nLine 13\nLine 14\nLine 15\nLine 16\nLine 17\nLine 18\nLine 19\nLine 20\n" +
						 "Line 21\nLine 22\nLine 23\nLine 24\nLine 25\nLine 26\nLine 27\nLine 28\nLine 29\nLine 30\n",
					"", 2);
				break;
			#endregion
			#region CHARACTER WIDTH
			case "test_sign2 - document - Character_Width":
				scr_text("123456789A123456789B123456789C123456789D123456789E\n" +
						 "Above line is 50 characters total.\n" +
						 "* * * * * * * * * * * * * * * * * * * * * * * * * *\n" +
						 "Above * is 50 total characters, including spaces.",
					"", 2);
				break;
			#endregion
			#region CHOICE AMOUNT
			case "test_sign2 - document - Choice_Amount":
				scr_text("Testing Choice Amount\n" +
						 "All of these close the box.\n" +
						 "There's 15 total here",
					"", 2);
					scr_option("1",		"END");
					scr_option("2",		"END");
					scr_option("3",		"END");
					scr_option("4",		"END");
					scr_option("5",		"END");
					scr_option("6",		"END");
					scr_option("7",		"END");
					scr_option("8",		"END");
					scr_option("9",		"END");
					scr_option("10",	"END");
					scr_option("11",	"END");
					scr_option("12",	"END");
					scr_option("13",	"END");
					scr_option("14",	"END");
					scr_option("15",	"END");
				break;
			#endregion
			#region NAME WIDTH
			case "test_sign2 - document - Name_Width":
				scr_text("Long name go", "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", 2);
				scr_text("50 Characters", "123456789A123456789B123456789C123456789D123456789E", 2);
				break;
			#endregion
			#region TEXT SPAM
			case "test_sign2 - document - Text_Spam":
				scr_text("This is meant to test the text capacity to check for lag. Anyways: " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "To any lore people out there: no, this is not a cypher, i just mashed my keyboard for like 3 lines then copied lol.",
					"", 2);
				break;
			#endregion
			#region PAGE AMOUNT (DOCUMENT ONLY)
			case "test_sign2 - document - Page_Amount":
				scr_text("This goes up to 15 pages, press left or right to move the pages btw, and [X] to close out",
					"1", 2);
				scr_text("i am not gonna do 100 pages for this rn lol.",
					"2", 2);
				scr_text("...",
					"3", 2);
				scr_text("... so hows your day going? Good i hope :)",
					"4", 2);
				scr_text("..... idk what to really put here but since is a tester i want it to be clear that you are fliping pages",
					"5", 2);
				scr_text("its cool that this can hold up to 475 characters total until it goes off of the page (excluding auto indents). " +
						 "500 if i change it to 20 lines instead of 19",
					"6", 2);
				scr_text("Im gonna just copy and paste some text, may aswell",
					"7", 2);
				scr_text("According to all known laws of aviation, " +
						 "there is no way a bee should be able to fly. " +
						 "Its wings are too small to get its fat little body off the ground. " +
						 "The bee, of course, flies anyway " +
						 "because bees don't care what humans think is impossible.",
					"8 - Start of the Bee Movie Script", 2);
				scr_text("Honestly kinda insane that its entire script is available online. ok lets do another one.\n" +
						 "a poem i made for the set up for Le Debut.",
					"9", 2);
				scr_text("\nThere is more...\n" +
						 "...more to this world than the walls it binds us by.\n",
					"10 - Ad Game  5th Revision (5/28~/2023) | 1/6", 2);
				scr_text("\nThrough these fractures, you have entered the library...\n" +
						 "...books of time...\n" +
						 "...pages of being...\n" +
						 "...tales of control...\n",
					"11 - Ad Game  5th Revision (5/28~/2023) | 2/6", 2);
				scr_text("\n...a game...\n" +
						 "...a game that is your's to act upon.",
					"12 - Ad Game  5th Revision (5/28~/2023) | 3/6", 2);
				scr_text("\nNo matter what you do within this world...\n" +
						 "...it will all end with the same outcome.\n" +
						 "\n" +
						 "You have made your choice.",
					"13 - Ad Game  5th Revision (5/28~/2023) | 4/6", 2);
				scr_text("\nFor now...\n" +
						 "We are at the beginning of this long scenario.\n" +
						 "\n" +
						 "Take the control...\n" +
						 "...and make your debut.",
					"14 - Ad Game  5th Revision (5/28~/2023) | 5/6", 2);
				scr_text("\nNow get up.",
					"15 - Le Debut 5th Revision (5/28~/2023) | 6/6", 2);
				break;
			#endregion
			#region FONT TESTER (DOCUMENT ONLY)
			case "test_sign2 - document - Font_Tester":
				scr_text("a b c d e f g h i j k l m n o p q r s t u v w x y z " +		// 1
						 "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z " +		// 2
						 "0 1 2 3 4 5 6 7 8 9 ¹ ² ³ ª º % $ € ¥ £ ¢ & * @ # | " +		// 3
						 "á â à ä å ã æ ç é ê è ë í î ì ï ı ñ ó ô ò ö õ ø œ š " +		// 4
						 "ß ú û ù ü ý ÿ ž Â À Ä Å Ã Æ Ç É Ê È Ë Í Î Ì Ï Ñ Ó Ô " +		// 5
						 "Ò Ö Õ Ø Œ Š Û Ù Ü Ý Ÿ , : ; - – — • . … “ ‘ ’ ‘ ‚ “ " +		// 6
						 "” „ ‹ › « » / \ ? ! ¿ ¡ ( ) [ ] { } © ® § + × = _ ° \n" +		// 7
						 "▯ (25AF & 9647)",
					"Recommended Character Set", 2);
				scr_text("░ (2591) ▒ (2592) ▓ (2593) █ (2588)",
					"Other Character Set", 2);
				scr_text("À à Á á Â â Ã ã Ä ä Ā ā Ă ă Å å Ǻ ǻ Ạ ạ Ą ą Æ æ Ǽ ǽ \n" +		// 1
						 "Ć ć Ĉ ĉ Č č Ċ ċ Ç ç \n" +
						 "Ď ď Đ đ Ð ð \n" +
						 "È è É é Ê ê Ẽ ẽ Ě ě Ë ë Ē ē Ĕ ĕ Ė ė Ẹ ẹ Ę ę \n" +
						 "Ĝ ĝ Ǧ ǧ Ğ ğ Ġ ġ Ģ ģ \n" +										// 5
						 "Ĥ ĥ Ħ ħ \n" +
						 "_ ı Ì ì Í í Î î Ĩ ĩ Ï ï Ī ī Ĭ ĭ İ Ị ị Į į \n" +
						 "_ ȷ Ĵ ĵ \n" +
						 "Ķ ķ _ ĸ \n" +
						 "Ĺ ĺ Ľ ľ Ļ ļ Ł ł Ŀ ŀ \n" +										// 10
						 "Ń ń Ñ ñ Ň ň Ņ ņ Ɲ ɲ Ŋ ŋ _ ŉ \n" +
						 "Ò ò Ó ó Ô ô Õ õ Ö ö Ō ō Ŏ ŏ Ő ő Ọ ọ Ǫ ǫ Ø ø Ǿ ǿ Œ œ \n" +
						 "Ŕ ŕ Ř ř Ŗ ŗ \n" +
						 "Ś ś Ŝ ŝ Š š Ş ş Ș ș \n" +
						 "ẞ ß \n" +														// 15
						 "Ť ť Ţ ţ Ț ț Ŧ ŧ \n" +
						 "Þ þ \n" +
						 "Ù ù Ú ú Û û Ũ ũ Ü ü Ū ū Ŭ ŭ Ů ů Ű ű Ụ ụ Ų ų \n" +
						 "Ẁ ẁ Ẃ ẃ Ŵ ŵ Ẅ ẅ ",											// 19
					"Underware  - Latin Plus (1/3)", 2);
				scr_text("Ỳ ỳ Ý ý Ŷ ŷ Ỹ ỹ Ÿ ÿ Ȳ ȳ \n" +
						 "Ź ź Ž ž Ż ż \n" +
						 "Ĳ ĳ \n" + 
						 "  \n" +
						 "Ə ə ",
					"Underware  - Latin Plus (2/3)", 2);
				scr_text("* �       \n" +
						 "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z " +
						 "a b c d e f g h i j k l m n o p q r s t u v w x y z " +
						 "* * ﬀ ﬁ * ﬂ *  ﬃ ﬄ  & @ * © ® ™ ^ ~ ` * ´ * ˆ * ˇ " +
						 "* * ˜ * ¨ * ¯ * ˉ ˘ * ˚ * ˝ * ˙ * ¸ ̣ ˛ ̦ * ­ - – — " +
						 "_ . , : ; ! ¡ ? ¿ … · ∙ • / \ | ¦ ( ) [ ] { } ' \" ‘ " +
						 "’ “ ” ‚ „ ‹ › « » ¶  # 0 1 2 3 4 5 6 7 8 9 * ⁄ ∕ ¼ " +
						 "½ ¾ ° % ‰ + − ± = ≠ ≈ × < > ≤ ≥ ÷ ¬ † ‡ § € ¤ $ ¢ ƒ " +
						 "£ ¥ ¹ ² ³ ª º № ∆ Δ Ω Ω µ μ π ℓ ℮ ∞ ∂ ∫ √ ∑ ∏ ◊ \n" +
						 "* - Character Without Unicode",
					"Underware  - Latin Plus (3/3)", 2);
				scr_text("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z " +
						 "À Á Â Ã Ä Ā Ă Å Ǻ Ạ Ą Æ Ǽ Ć Ĉ Č Ċ Ç Ď Đ Ð È É Ê Ẽ Ě " +
						 "Ë Ē Ĕ Ė Ę Ĝ Ǧ Ğ Ġ Ģ Ĥ Ħ _ Ì Í Î Ĩ Ï Ī Ĭ İ Ị Į _ Ĵ Ķ " +
						 "_ Ĺ Ľ Ļ Ł Ŀ Ń Ñ Ň Ņ Ɲ Ŋ _ Ò Ó Ô Õ Ö Ō Ŏ Ő Ọ Ǫ Ø Ǿ Œ " +
						 "Ŕ Ř Ŗ Ś Ŝ Š Ş Ș ẞ Ť Ţ Ț Ŧ Þ Ù Ú Û Ũ Ü Ū Ŭ Ů Ű Ụ Ų Ẁ " +
						 "Ẃ Ŵ Ẅ Ỳ Ý Ŷ Ỹ Ÿ Ȳ Ź Ž Ż Ə",
					"Final Set With Latin+ (Uppercase - 1/3)", 2);
				scr_text("a b c d e f g h i j k l m n o p q r s t u v w x y z " +
						 "à á â ã ä ā ă å ǻ ạ ą æ ǽ ć ĉ č ċ ç ď đ ð è é ê ẽ ě " +
						 "ë ē ĕ ė ę ĝ ǧ ğ ġ ģ ĥ ħ ı ì í î ĩ ï ī ĭ _ ị į ȷ ĵ ķ " +
						 "ĸ ĺ ľ ļ ł ŀ ń ñ ň ņ ɲ ŋ ŉ ò ó ô õ ö ō ŏ ő ọ ǫ ø ǿ œ " +
						 "ŕ ř ŗ ś ŝ š ş ș ß ť ţ ț ŧ þ ù ú û ũ ü ū ŭ ů ű ụ ų ẁ " +
						 "ẃ ŵ ẅ ỳ ý ŷ ỹ ÿ ȳ ź ž ż ə",
					"Final Set With Latin+ (Lowercase - 2/3)", 2);
				scr_text("& @ * © ® ™ ^ ~ ` ´ ˆ ˇ ˜ ¨ ¯ ˉ ˘ ˚ ˝ ˙ ¸ ̣ ˛ ̦ - – " +
						 "— _ . , : ; ! ¡ ? ¿ … · ∙ • / \ | ¦ ( ) [ ] { } ' \" " +
						 "‘ ’ “ ” ‚ „ ‹ › « » ¶  # 0 1 2 3 4 5 6 7 8 9 ⁄ ∕ ¼ " +
						 "½ ¾ ° % ‰ + − ± = ≠ ≈ × < > ≤ ≥ ÷ ¬ ♩ ♪ ♫ ♬ † ‡ § " +
						 "€ ¤ $ ¢ ƒ £ ¥ ¹ ² ³ ª º № ∆ Δ Ω Ω µ μ π ℓ ℮ ∞ ∂ ∫ √ " +
						 "∑ ∏ ◊ ■ □ ▯ ░ ▒ ▓ █ ← → ↑ ↓ ✓ 𐄂 ◯  �",
					"Final Set With Latin+ (Other/Misc. - 3/3)", 2);
				scr_text("()()()\n" +
						 "()ČČ\n" +
						 "()ČČ\n" +
						 "()()()",
					"Indent Test", 2);
				break;
			
			// these indent on M and Z, fix later - 7/2/2024
			#endregion
			#region FORCE POSITION
			case "test_sign2 - document - Force_Position":
				scr_text("Position is automated.", "Auto", 2, noone, 0);
				scr_text("Main Position", "Main", 2, noone, 1);
				scr_text("Alternate Position", "Alt", 2, noone, 2);
				break;
			#endregion
		#endregion
		
		#region test_sign2 - cinematic
		case "test_sign2 - cinematic":
			#region MAIN
			scr_text("What would you like to test out?",
						"Testing: Cinematic", 0); // 3
				scr_option("Line Amount",									"test_sign2 - cinematic - Line_Amount");
				scr_option("Character Width",								"test_sign2 - cinematic - Character_Width");
				scr_option("Choice Amount",									"test_sign2 - cinematic - Choice_Amount");
				scr_option("Name Width",									"test_sign2 - cinematic - Name_Width");
				scr_option("Text Spam",										"test_sign2 - cinematic - Text_Spam");
				scr_option("Force Position",								"test_sign2 - cinematic - Force_Position");
				scr_option("<Next: Textbox>",								"test_sign2 - textbox");
				scr_option("<Leave>",										"END");
			break;
			#endregion
			#region LINE AMOUNT
			case "test_sign2 - cinematic - Line_Amount":
				scr_text("Line_1_(30_Total_Lines_Here)\nLine 2\nLine 3\nLine 4\nLine 5\nLine 6\nLine 7\nLine 8\nLine 9\nLine 10\n" +
						 "Line 11\nLine 12\nLine 13\nLine 14\nLine 15\nLine 16\nLine 17\nLine 18\nLine 19\nLine 20\n" +
						 "Line 21\nLine 22\nLine 23\nLine 24\nLine 25\nLine 26\nLine 27\nLine 28\nLine 29\nLine 30\n",
					"", 3);
				scr_game_text("test_sign2 - cinematic");
				break;
			#endregion
			#region CHARACTER WIDTH
			case "test_sign2 - cinematic - Character_Width":
				scr_text("123456789A123456789B123456789C123456789D123456789E123456789F13456789G\n" +
						 "Above line is 70 characters total.\n" +
						 "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" +
						 "Above * is 70 total characters, including spaces.",
					"", 3);
				scr_game_text("test_sign2 - cinematic");
				break;
			#endregion
			#region CHOICE AMOUNT
			case "test_sign2 - cinematic - Choice_Amount":
				scr_text("Testing Choice Amount\n" +
						 "All of these close the box.\n" +
						 "There's 15 total here",
					"", 3);
					scr_option("1",		"END");
					scr_option("2",		"END");
					scr_option("3",		"END");
					scr_option("4",		"END");
					scr_option("5",		"END");
					scr_option("6",		"END");
					scr_option("7",		"END");
					scr_option("8",		"END");
					scr_option("9",		"END");
					scr_option("10",	"END");
					scr_option("11",	"END");
					scr_option("12",	"END");
					scr_option("13",	"END");
					scr_option("14",	"END");
					scr_option("15",	"END");
				break;
			#endregion
			#region NAME WIDTH
			case "test_sign2 - cinematic - Name_Width":
				scr_text("Long name go", "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", 3);
				scr_text("50 Characters", "123456789A123456789B123456789C123456789D123456789E", 3);
				scr_game_text("test_sign2 - cinematic");
				break;
			#endregion
			#region TEXT SPAM
			case "test_sign2 - cinematic - Text_Spam":
				scr_text("This is meant to test the text capacity to check for lag. Anyways: " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "skdj fd fiad kjksb kfoiewj fkjdfksiekjd hsdish doisjd nk cuish jkdcn osdhjf ks foij ffn jkcn iwehsnjcks " +
						 "sjd nasdf nosdkf nos dnkmf f idkn dsjnf ksdfoisjd fns d dskjfns osdij akd ofji dkfns,nds aondlfk,nasdf oia " +
						 "gcfbhjgbhv h hjbc cvbh kb h djihajo cao ahdcaoi  adio cio cio  ahioc hoa a  ajsc  dacihj ha iao ahoi haiso " +
						 "To any lore people out there: no, this is not a cypher, i just mashed my keyboard for like 3 lines then copied lol.",
					"", 3);
				scr_game_text("test_sign2 - cinematic");
				break;
			#endregion
			#region FORCE POSITION
			case "test_sign2 - cinematic - Force_Position":
				scr_text("Position is automated.", "Auto", 3, noone, 0);
				scr_text("Main Position", "Main", 3, noone, 1);
				scr_text("Alternate Position", "Alt", 3, noone, 2);
				scr_game_text("test_sign2 - cinematic");
				break;
			#endregion
		#endregion
		#endregion
		
		#region CHOICES TEST 1 - Lore Dump
		case "test_sign3":
			scr_text("What would you like to learn about?",
						"Lore Dump");
				scr_option("Dream #182-C",		"test_sign3 - Dream_Exerpt");
				scr_option("Me",				"test_sign3 - Costel");
				scr_option("Rianne",			"test_sign3 - Rianne");
				scr_option("The Clinic",		"test_sign3 - The_Clinic");
				scr_option("<Leave>",			"END");
			break;
			
			#region test_sign3 - Dream_Exerpt
			case "test_sign3 - Dream_Exerpt":
				scr_text("Dream #182-C\n" + 
						 "     Thursday, November 2nd, 2023\n" +
						 "     C - Dream Section 3/4\n" +
						 "     The dream that fathomed the creation of OUTPATIENT.",
							"Lore Dump");
				scr_text("Would you like to read the exerpt?\n" +
						 "  *  Note that parts are redacted for lore reasons.",
							"Lore Dump");
					//scr_option("Read Dream #182-C",									"test_sign3 - Dream_Read");
					scr_option("Read Dream #182-C [REDACTED VER.]",		"test_sign3 - Dream_Read_Redacted");
					scr_option("<Don't Read>",										"END");
				break;
				#region test_sign3 - Dream_Read_Redacted
				case "test_sign3 - Dream_Read_Redacted":
					scr_text("(Thursday, November 2nd, 2023)\n\n" +
							 "To summarize in just one word: Hospital.\n" +
							 "To summarize in sentences:\n" +
							 "     I woke up in this hospital room, " +
							 "I can't remember much but the lights were off and the only light that was illuminating it was the door window. " +
							 "The room I was in was the size of one of those checkup rooms but slightly smaller, " +
							 "like your low budget/needs medical",
						"Dream #182-C", 2);
					scr_text(" room: long bench opposite from the door and cabinets opposite side of the adjacent wall of the door." +
							 "I woke up on the bench and the door was on the right side of the wall, " +
							 "the cabinets to my left on that entire wall. " +
							 "There could have been more stuff in the room but that was all of the most notable stuff.\n" +
							 "     Honestly I have no clue if I was even directly admitted or this was a free form thing that happened with me, " +
							 "there were no doctors or",
						"Dream #182-C", 2);
					scr_text(" anyone else in the room with me, and considering that the light was off, " +
							 "I'm guessing I was left there to rest up on unofficial terms or something, idk.\n" +
							 "     As for me, I was a dragon again, only this time I was now male. " +
							 "I had red scales and a white/light gray underside of plated scales. " +
							 "I think I was fairly younger than the other 2 dragons I was, I was likely like around 17 I would say. " +
							 "I was wearing a large red woven",
						"Dream #182-C", 2);
					scr_text(" sweater that went over my hands and reached down to my knees almost, " +
							 "I also had on a white polo shirt underneath it also, its collar was poking out the sweater. " +
							 "I can't remember if I had any pants on. " +
							 "I was like that one style of just only having a shirt on but the shirt is so big that it acted like shorts so I was fine lol. " +
							 //"As for my body type, I think I was fairly skinny but then nearing the end of this part [REDACTED], [REDACTED].",
							 //"As for my body type, I think I was fairly skinny but then nearing the end of this part [                ], [             ].",
							   "As for my body type, I think I was fairly skinny but then nearing the end of this part ██████████████████, ███████████████.",
						"Dream #182-C", 2);
					scr_text("     Anyways, I walked out of the room and then headed for the elevator to leave. " +
							 "The elevator opens and I walked inside, there were about 4 other people already in the elevator I can't remember all of them. " +
							 "3 of which: 2 were to the far side of the elevator and the 3rd right near the buttons, " +
							 //"all 3 of them were [REDACTED]. " +
							 //"all 3 of them were [                   ]. " +
							   "all 3 of them were ██████████████\n███████. " +
							 "I can't remember which species they all were but I'm sure one of them at the far end to the left most wall was a",
						"Dream #182-C", 2);
					scr_text(" dragon and the one near the buttons was some sort of squid or octopus. " +
							 "Idk the other guy, maybe a bird? The 4th person however I did remember most, they were a sheep and was fairly skinny, " +
							 "but I think their wool made them look larger than they actually were, they were shorter than I was though. " +
							 "I can't remember if they had any clothing on or anything to be honest. " +
							 "Their wool was white and had some black highlights to it along their backside",
						"Dream #182-C", 2);
					scr_text(" mostly, like they dyed it or something. Their base skin was a midtone gray I think.\n" +
							 "     I pressed the button for the Lobby and stood at the right corner, " +
							 "next to the sheep on my right and the octopus(?) to my front. As I pressed the button however, " +
							 //"I thought to myself saying that \"I would probably consider myself [REDACTED]\" after seeing everyone else in the elevator " +
							 //"I thought to myself saying that \"I would probably consider myself [          ]\" after seeing everyone else in the elevator " +
							   "I thought to myself saying that \"I would probably consider myself ████████████\" after seeing everyone else in the elevator " +
							 "(excluding the sheep because I didn't see them at first).",
						"Dream #182-C", 2);
					scr_text("     The sheep was getting off at one of the floors, I think the 2nd or 1st floor, " +
							 "whichever floor was 1st or 2nd to the Lobby floor. They told a joke on their way out to everyone in the elevator. " +
							 "I genuinely can't remember it other than that it was a sheep related joke. It being something about \"fleece.\" " +
							 "I don't know but that was the one word I did remember.\n" +
							 "     They then left and the elevator kept going, " +
							 "I can't fully remember",
						"Dream #182-C", 2);
					scr_text(" the lobby but I do wanna say that I did walk out of that elevator.\n" +
							 "     I then woke up and then fell back to sleep.",
						"Dream #182-C", 2);
					break;
				#endregion
			#endregion
			#region test_sign3 - Costel
			case "test_sign3 - Costel":
				scr_text("NAME     Costel\n" +
						 "PGP.     He/Him\n" +
						 "SPP.     Dragon\n" +
						 "HGT.     5'10\" / 1.778m\n" +
						 "AGE      17 Years",
							"Costel Info");
				break;
			#endregion
			#region test_sign3 - Rianne
			case "test_sign3 - Rianne":
				scr_text("NAME     Rianne\n" +
						 "PGP.     They/Them\n" +
						 "SPP.     Sheep\n" +
						 "HGT.     5'8\" / 1.727m\n" +
						 "AGE      19 Years",
							"Rianne Info");
				break;
			#endregion
			#region test_sign3 - The_Clinic
			case "test_sign3 - The_Clinic":
				scr_text("\n\n     [NO INFORMATION AVAILABLE]",
							"The Clinic Info");
					//scr_text_color(0, 35, c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange);
					scr_option("(info also unavailable) <Come Back Later>",		"END");
				break;
			#endregion
		#endregion
		
		#region COLORS TESTING - Pride Month
		case "test_sign4":
			scr_text("Pride Month Letsgooooooo\n" +
					 "We testing colors with this.\n" +
					 "Wanna see base colors or the colors asorted like the LGBTQ+ flags?\n" +
					 "*Note that colors arent working rn.");
				scr_option("Base Custom Colors",		"test_sign4 - Base_Colors");
				scr_option("LGBTQ+ Flags Colors",		"test_sign4 - LGBTQ_Flags");
				scr_option("<Leave>",			"END");
			break;
			case "test_sign4 - Base_Colors":
				scr_text("c_outp_orange     >     #FF6800");
					//scr_text_color(0, 12, c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange);
					//scr_text_color(23, 30, c_outp_orange, c_outp_orange, c_outp_orange, c_outp_orange);
				break;
			case "test_sign4 - LGBTQ_Flags":
				scr_text("************\n" +
						 "Gay\n" +
						 "Lesbian\n" +
						 "Bisexual\n" +
						 "Pansexual\n");
					//scr_text_color(0, 1, c_yellow, c_yellow, c_yellow, c_yellow);
					//scr_text_color(1, 2, c_purple, c_purple, c_purple, c_purple);
					//scr_text_color(2, 3, c_yellow, c_yellow, c_yellow, c_yellow);
					//scr_text_color(3, 4, c_white, c_white, c_white, c_white);
				scr_text("************\n" +
						 "Nonbinary\n" +
						 "Transgender\n" +
						 "Genderfluid\n" +
						 "Intersex\n");
				scr_text("************\n" +
						 "Agender\n" +
						 "Asexual\n" +
						 "Aromantic\n" +
						 "Demisexual\n");
				break;
		
		#endregion
		
		#region TEXT BUBBLE TESTING
		
		// kinda want these ones to be able to just scroll through each line, kinda like Earthbound.
		
		case "test_sign5":
			//scr_text("This sign literally says nothing.\n...not sure why I tried reading it like it does...heh.",
			//			"",	1);
						//"Costel",	1,	obj_player);
			scr_text("(It's a blank sign.)",
						"",		1,		obj_interaction_follow);
			scr_text("This sign literally says nothing.",
						"Costel",		1,		obj_player);
			scr_text("...not sure why I tried reading it...",
						"Costel",		1,		obj_player);
			scr_text("...like it does.\n...heh.",
						"Costel",		1,		obj_player);
			break;
		#endregion
		
		#region ROOM TRANSITION
		// Testing the room transition script in text options.
		/*	Since some entrance ways won't need text confirmation to enter, I would prefer for those to not be
			in the same script as the lore texts here.
			In the case for doors that can be unlocked to then nolonger need the text confirmation, then I
			dont care if those are in here.
		*/
		case "test_sign6":
			scr_text("Would you like to enter the 2nd test room? ( * [_W_] will crash.)\n" +
					 "     T = Text\n" +
					 "     W = Warp\n" +
					 "     D = Destroy",
						"Door");
				scr_option("<Enter - Style A> [_W_]",		"test_sign6 - enter_doorA");
				scr_option("<Enter - Style B> [TW_]",		"test_sign6 - enter_doorB");
				scr_option("<Enter - Style C> [_WD]",		"test_sign6 - enter_doorC");
				scr_option("<Enter - Style D> [TWD]",		"test_sign6 - enter_doorD");
				scr_option("<Leave>           [___]",		"END");
			break;
			
			/*					TEXT		WARP		DESTROY
					STYLE A					X
					STYLE B		X			X			
					STYLE C					X			X
					STYLE D		X			X			X
					
					So B, C, and D all work.
					
					D will skip all and any further text.
					B & C are examples of what to do here.
					
					STYLE A crashes the game because there's no text prompt or manual destroy to
					end the script. The Warp Script is standalone from how the text object
					functions. Ngl, thats definitely why the Case"END" requires a destroy
					to actually end a textbox.
			*/
			
			#region STYLE A (MAIN)
			case "test_sign6 - enter_doorA":
				//scr_text("Let's go then.", "Door");
				warp_player(rm_testing2, 1000, 160, -1);
				//instance_destroy();
				// id love it if this instance destroy could happen in the waro script but idk because it
				// wont play the full anim if I do so idk
				//		Yea forget that, ill just conceed with the player warp in the game text to require
				//		an instance destroy after it.
				// I also dont have the ability so it can move you to an area in the case that i want you to
				// read a certain text then transition.
				break;
			#endregion
			#region STYLE B
			case "test_sign6 - enter_doorB":
				scr_text("Let's go then.", "Door");
				warp_player(rm_testing2, 1000, 160, -1);
				//instance_destroy();
				break;
			#endregion
			#region STYLE C
			case "test_sign6 - enter_doorC":
				//scr_text("Let's go then.", "Door");
				warp_player(rm_testing2, 1000, 160, -1);
				instance_destroy();
				break;
			#endregion
			#region STYLE D
			case "test_sign6 - enter_doorD":
				scr_text("Let's go then.", "Door");
				warp_player(rm_testing2, 1000, 160, -1);
				instance_destroy();
				break;
			#endregion
		#endregion
		
		#region ROOM TRANSITION 2 (All rooms, or atleast most of them lol)
		
		// I wonder if i can turn this into an entire for loop for rooms.....
		
		case "test_sign7":
			scr_text("What room would you like to go to?\n" +
					 "  *  Note that this door is not responsible for softlocks or crashes due to the room you choose to enter. " +
					 "(" + string(room_last) + ")",
						"Universal Door");
				
				//var _str_is_current_room = "";
				
				/* idk im not gonna bother for now.
				for (var i, i < room_last, i++) { // each option
					//if (room_last > 10) { // Multiple pages.
						
					//}
					if (i == room) _str_is_current_room = " (Current Room)";
					scr_option("<" + room_get_name(i) + ">" + _str_is_current_room,		"test_sign7 - warp_selection");
					
					case "test_sign7 - warp_selection":
						scr_text("Heading to [" + room_get_name(i) + "]...");
						warp_player(room_, room_width / 2, room_height / 2, 0);
						break;
				} */
				
				//scr_option("<" + room_get_name(i) + ">" + _str_is_current_room,		"test_sign7 - rm_test1");
				
				scr_option("<Leave>",		"END");
				scr_option("<Can't be bothered to figure it out rn,\nvery complex :( >",		"END");
			break;
		
		//case "test_sign7 - warp_selection":
		//	scr_text("Heading to [" + room_get_name(i) + "]...");
		//	warp_player(rm_testing2, room_width / 2, room_height / 2, 0);
		//	break;
		
		#endregion
		
		#region INTERACTION AMOUNT TESTING
		
		/*	the way this works is by adding a number to what should be checked because of this,
			all of these need to have numbers at the end of them.
			RULES:
			1.	No other characters can come after the numbers.
			2.	When calling these in the creation code of an object, all characters before the integer have to be in its ID since
				the number is automated within the object itself.
		*/
		
		case "test_sign8 - interaction_description":
			scr_text("The following colored signs are here to demonstrate several things you can do with signs:",
						"Sign Interaction Descriptions");
			scr_text("Red - Default Text (ERROR TEXT)\n" +
					 "Yellow - Loop Text (Default)\n" +
					 "Green - Hold Text\n" +
					 "Blue - End Text\n" +
					 "Magenta - Randomize Text",
						"Sign Interaction Descriptions");
			break;
		
		// No region for the error text since its in the default.
		#region TEST LOOP
		//"test_sign8 - loop"
		case "test_sign8 - loop1":
			scr_text("You know what they say....",
						"Loop Text 1", 1, obj_interaction_follow);
			break;
		case "test_sign8 - loop2":
			scr_text("...what?",
						"Loop Text 2", 1, obj_interaction_follow);
			scr_text("Did you expect me to quote what they say?",
						"Loop Text 2", 1, obj_interaction_follow);
			scr_text("You should already know.",
						"Loop Text 2", 1, obj_interaction_follow);
			break;
		case "test_sign8 - loop3":
			scr_text("...you really don't know it do you?",
						"Loop Text 3", 1, obj_interaction_follow);
			scr_text("I'm sure you'll learn it soon.",
						"Loop Text 3", 1, obj_interaction_follow);
			break;
		case "test_sign8 - loop4":
			scr_text("Do I know it?",
						"Loop Text 4", 1, obj_interaction_follow);
			scr_text("Yes.... Yeah I do.",
						"Loop Text 4", 1, obj_interaction_follow);
			break;
		case "test_sign8 - loop5":
			scr_text("What? You want me to say it?",
						"Loop Text 5", 1, obj_interaction_follow);
			scr_text("I don't give out help for free.",
						"Loop Text 5", 1, obj_interaction_follow);
			break;
		case "test_sign8 - loop6":
			scr_text("You won't leave until I say it, will you?",
						"Loop Text 6 (Final)", 1, obj_interaction_follow);
			scr_text("Alright, fine... just for you. ;)",
						"Loop Text 6 (Final)", 1, obj_interaction_follow);
			break;
		#endregion
		
		#region TEST HOLD
		//"test_sign8 - hold"
		case "test_sign8 - hold1":
			scr_text("Hey, do you ever just wonder...",
						"Hold Text 1", 1, obj_interaction_follow);
			scr_text("...about why we- uh...",
						"Hold Text 1", 1, obj_interaction_follow);
			break;
		case "test_sign8 - hold2":
			scr_text("Sorry, I actually don't know where I was going with this.",
						"Hold Text 2", 1, obj_interaction_follow);
			break;
		case "test_sign8 - hold3":
			scr_text("Uhhhh... do you...",
						"Hold Text 3", 1, obj_interaction_follow);
			scr_text("I don't know... uh, do you like dragons?",
						"Hold Text 3", 1, obj_interaction_follow);
			break;
		case "test_sign8 - hold4":
			scr_text("Oh wait, you are a dragon?",
						"Hold Text 4", 1, obj_interaction_follow);
			scr_text("That's so cool.",
						"Hold Text 4", 1, obj_interaction_follow);
			scr_text("Can you breathe fire? Can you fly?",
						"Hold Text 4", 1, obj_interaction_follow);
			break;
		case "test_sign8 - hold5":
			scr_text("...Wait, you don't have wings...",
						"Hold Text 5", 1, obj_interaction_follow);
			scr_text("...Can you still breathe fire?",
						"Hold Text 5", 1, obj_interaction_follow);
			scr_text("--actually, nevermind...",
						"Hold Text 5", 1, obj_interaction_follow);
			scr_text("Sorry if my questions might be odd...",
						"Hold Text 5", 1, obj_interaction_follow);
			scr_text("Sorry...",
						"Hold Text 5", 1, obj_interaction_follow);
			break;
		case "test_sign8 - hold6":
			scr_text("...Take care, I guess.",
						"Hold Text 6 (Final)", 1, obj_interaction_follow);
			break;
		#endregion
		
		#region TEST END
		//"test_sign8 - end"
		case "test_sign8 - end1":
			scr_text("...um...hi?",
						"End Text 1", 1, obj_interaction_follow);
			break;
		case "test_sign8 - end2":
			//scr_text("Forgive me, but I'm not really in the mood to chat right now.",
			scr_text("Forgive me, but I'm not really in the mood to chat.",
						"End Text 2", 1, obj_interaction_follow);
			scr_text("...Maybe some other time?",
						"End Text 2", 1, obj_interaction_follow);
			break;
		case "test_sign8 - end3":
			scr_text("(I shouldn't bother them.)",
						"End Text 3 (Final)", 1, obj_player);
			break;
		#endregion
		
		#region TEST RANDOM
		//"test_sign8 - random"
		case "test_sign8 - random1":
			scr_text("Fun Fact (1/5):",
						"Random Text 1/5", 0);
			scr_text("jdxl2013 has worked on a total of 6 different developed games as of 8/30/2024, 1:26AM.",
						"Random Text 1/5", 0);
			scr_text("And oh' that number is sure to become higher in the future.",
						"Random Text 1/5", 0);
			break;
		case "test_sign8 - random2":
			scr_text("Fun Fact (2/5):",
						"Random Text 2/5", 0);
			scr_text("jdxl2013 is left handed.",
						"Random Text 2/5", 0);
			scr_text("I guess that's a bit too short for a fun fact...",
						"Random Text 2/5", 0);
			scr_text("Uhh- orange is his favorite color! There's a bonus fact for ya.",
						"Random Text 2/5", 0);
			break;
		case "test_sign8 - random3":
			scr_text("Fun Fact (3/5):",
						"Random Text 3/5", 0);
			scr_text("jdxl2013 comes up with so many ideas for games and art that he keeps a list of stuff he could make!",
						"Random Text 3/5", 0);
			scr_text("How many ideas has he came up with? I don't know, too many to count within an hour.",
						"Random Text 3/5", 0);
			break;
		case "test_sign8 - random4":	
			scr_text("Fun Fact (4/5):",
						"Random Text 4/5", 0);
			scr_text("As of 8/30/2024, 1:37AM, jdxl2013 has 308+ total documented dreams.",
						"Random Text 4/5", 0);
			scr_text("As this size got larger, he started refering to each of his dreams like SCP.",
						"Random Text 4/5", 0);
			scr_text("For instance, the listing for OUTPATIENT is Dream #182-C.",
						"Random Text 4/5", 0);
			break;
		case "test_sign8 - random5":	
			scr_text("Fun Fact (5/5):",
						"Random Text 5/5", 0);
			scr_text("Who exactly is jdxl2013, you may ask?",
						"Random Text 5/5", 0);
			scr_text("I don't know. I thought he was also a dragon just like you...",
						"Random Text 5/5", 0);
			scr_text("...but apparently I just met someone named Xavier.",
						"Random Text 5/5", 0);
			scr_text("If you get the chance, ask them about jdxl2013, I'm sure they know far more than I do.",
						"Random Text 5/5", 0);
			scr_text("...jdxl2013 doesn't even sound like a real name to be honest....",
						"Random Text 5/5", 0);
			break;			
		#endregion
		
		#endregion
		
		#region TESTING OPTIMIZED TEXT CALL
		
		case "test_sign9 - new text code":
			
			scr_text("Default (nothing)");
			scr_text("Default (nothing 2)");
			scr_text_values("Name Change");
			scr_text("Name Change 1 (name should be <name change>)");
			scr_text("Name Change 2 (hold 1)");
			scr_text("Name Change 3 (hold 2)");
			
			scr_text_values("Name Change", 1);
			scr_text("Box Change 1 (box is now small)");
			scr_text("Box Change 2 (hold)");
			
			scr_text_values("Costel", 1, obj_player);
			scr_text("Costel Change (following costel rn)");
			scr_text_values("No One", 1, noone);
			scr_text("No One Change (following noone rn)");
			
			scr_text_values("No One", 3, noone, 0);
			scr_text("Cinematic");
			scr_text_values("No One", 3, noone, 2);
			scr_text("Cinematic Below");
			break;
		
		#endregion
		
		#region IN TEXTBOX CODE (Start & End of Pages)
		
		case "test_sign10 - textbox_code":
			
			scr_text_values("Testing Textbox Code");
			scr_text("Create Function (start)\n\nAll of these just toggle the player sprites.");
			scr_text_function_start_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text("(start)");
			scr_text_function_start_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text("(end)");
			scr_text_function_end_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text("(end)");
			scr_text_function_end_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text("(hold)");
			
			scr_text("(start) (end)");
			scr_text_function_start_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text_function_end_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text("(start)");
			scr_text_function_start_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text("(hold)");
			
			scr_text("(end)");
			scr_text_function_end_page(function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			break;
		
		#endregion
		
		#region IN TEXTBOX CODE 2 (Dependent on the character of the string).
		
		case "test_sign10 - textbox_code2":
			
			scr_text_values("Testing Textbox Code 2");
			scr_text("Code will run per each character of the textbox. Indicated by !");
			scr_text_values("On 5 / 10");
			scr_text("....!.....");
			scr_text_function_drawn_text(5, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On 1 / 10");
			scr_text("!.........");
			scr_text_function_drawn_text(1, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On 10 / 10");
			scr_text(".........!");
			scr_text_function_drawn_text(10, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On 15 / 10 (Still 10, Clamp Value)");
			scr_text(".........!");
			scr_text_function_drawn_text(15, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On -15 / 10 (1, Clamp Value)");
			scr_text("!.........");
			scr_text_function_drawn_text(-15, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On 0 / 10 (1, Clamp Value)");
			scr_text("!.........");
			scr_text_function_drawn_text(0, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("HOLD");
			scr_text("Wait For next up, multiple in one.");
			
			scr_text_values("On 1,5,10 / 10");
			scr_text("!...!....!");
			scr_text_function_drawn_text(1, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text_function_drawn_text(5, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text_function_drawn_text(10, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On 3,7 / 10");
			scr_text("..!...!...");
			scr_text_function_drawn_text(3, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text_function_drawn_text(7, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			
			scr_text_values("On 4,5,6 / 10");
			scr_text("...!!!....");
			scr_text_function_drawn_text(4, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text_function_drawn_text(5, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			scr_text_function_drawn_text(6, function() { obj_player.char_var = obj_player.char_var == 0 ? 2 : 0; });
			break;
		
		#endregion
		
		#region GENERAL SIGNS
		
		#region Update 6 Vending Machine Text
		case "rm_testing2 - Item_Room_Sign":
			scr_text("Item Room\n" +
					 "-Coming Soon-\n" +
					 "If you need to test the items right now, please see the vending machine.");
			scr_text("(There is no vending machine im literally rushing this for the September update, just check your inventory)");
			break;
		#endregion
		
		#region ROOM TRANSITION 3 | Same Room Doorway Texts
		case "rm_testing1 - floor0_door": scr_text("“Floor 0”", "", 1, obj_interaction_follow); break;
		case "rm_testing1 - floor0_look": scr_text("“Look below.”", "", 1, obj_interaction_follow); break;
		
		case "rm_testing1 - floor-1_door": scr_text("“Floor -1”", "", 1, obj_interaction_follow); break;
		case "rm_testing1 - floor-1_look": scr_text("“Look above.”", "", 1, obj_interaction_follow); break;
		#endregion
		
		#endregion
		
		#endregion
		
		
		
		#region ITEM STUFFS
		
		#region Basic Stuff
		case "item_get":
			scr_text("You picked up <" + string(global.inventory.items[array_length(global.inventory.items) - 1].name) + ">."
				);
				//, "", 1, obj_player);
			//scr_text("You picked up [Item Name Here, implement this lol].");
			break;
		case "item_no_use":
			scr_text("This item has no use.");
			break;
		#endregion
		
		#region Test Item 1
		case "use_test_item_1":
			scr_text("You held the rock close to your eye, facinated by its intricate roughness and red hue, " +
					 "pondering if there is anything that makes this rock special.",
				"", 0, noone, 1); //more to this rock than what it gives on.");
			scr_text(".....",
				"Costel", 1, obj_player, 1);
			scr_text("Nope, just a really red rock.",
				"Costel", 1, obj_player, 1);
			scr_text("...still kinda cool though.",
				"Costel", 1, obj_player, 1);
				//scr_option("<Observe The Rock>",		"use_test_item_1 (2)");
			break;
		case "use_test_item_1 (2)":
			scr_text(".....",
				"Costel", 1, obj_player);
			scr_text("Nope, just a really red rock.",
				"Costel", 1, obj_player);
			scr_text("...still kinda cool though.",
				"Costel", 1, obj_player);
			break;
		#endregion
		
		#region Pill Bottle
		case "use_pill_bottle":
			scr_text("You consumed the pills that were once inside the bottle. You are now left with an empty pill bottle.");
			break;
		case "use_pill_bottle_emptyA":
			scr_text("Somehow, for some reason, you managed to regurgitate the pills and put them back inside the bottle. ...What?");
			break;
		case "use_pill_bottle_emptyB":
			scr_text("For some reason, you decided to eat the pill bottle itself. ...Why would you do that?");
			break;
		#endregion
		
		#region File Doc
		case "use_file_doc":
			scr_text("Without looking, you pulled out a document from the folder.\n\n" +
					 "A random document has been added to your DOCUMENTS.");
			break;
		#endregion
		
		#region Paper Doc
		case "use_paper_doc":
			scr_text("You added the random document to your DOCUMENTS collection.");
			break;
		#endregion
		
		#region Flute Text (Demo)
		#region Flute Item
		case "use_flute_text":
			var _flute_text_rng = [
			"A door has appeared nearby.",
			"The flute has revealed a door.",
			"The symphony brings listeners to your play. A passage is sent your way.",
			"Piercing whistles flow through the air, your world becomes a bit more open to you.",
			"A cacophony chars the wind - a door becomes agape."
			];
			
			scr_text(_flute_text_rng[irandom(array_length(_flute_text_rng) - 1)]);
			break;
		#endregion
		#region Flute Door
		case "flute_door_locked":
			var _flute_door_rng = [
			"It's a lonely door frame.",
			"...A door could be here, but there is none.",
			"There is no door here...?",
			"What is a door without it's frame?"
			];
			
			scr_text(_flute_door_rng[irandom(array_length(_flute_door_rng) - 1)], "", 1, obj_interaction_follow);
			break;
		#endregion
		#endregion
		
		#endregion
		
		
		
		#region *** DEMO TEXTS ***
		
		#region SAVE MENU FLAVOR STUFFS
		case "save_menu_flavor_text":
			var _save_menu_flavor_texts =
			[
				{
					a : "It's a laptop.",
					b : "...I'm sure no one will mind you using it.",
				},
				{
					a : "It's an open laptop left unattended.",
					b : "...No one is going to miss it",
				},
				{
					a : "It's a laptop left on the table.",
					b : "...It's going to go cold if no one else will eat it.",
				},
			];
			var _save_menu_flavor_rng = irandom(array_length(_save_menu_flavor_texts) - 1);
			if (!check_if_save_data_exists()) _save_menu_flavor_rng = 0;
			
			scr_text_values("", 1, obj_interaction_follow);
			scr_text(_save_menu_flavor_texts[_save_menu_flavor_rng].a);
			scr_text(_save_menu_flavor_texts[_save_menu_flavor_rng].b);
			scr_text_function_end_page(function() { scr_save_menu(); });
			
			break;
		#endregion
		
		#region EXPLORATION
		
		#region Secret Bus
		case "secret_happy_bus_sign":
			// Excerpts from the dream.
			scr_text_values("Bus Sign", 1, obj_interaction_follow);
			scr_text("Dream #66\nJanuary 16th 20...");
			scr_text("...I was in a bus... traveling to that red brick neighborhood...");
			scr_text("...a lot more foliage on the side...");
			scr_text("...wierd intersection...");
			scr_text("...pale-ish door... led to the playground...");
			scr_text("...I turn turn back... gray, spiraling stairs...");
			scr_text("....the friend....");
			scr_text(".....play my song.....");
			scr_text(".........\n.........\nBROKEN?");
			scr_text_function_end_page(function() {
				if (instance_exists(obj_bus_sign)) {
					instance_destroy(obj_bus_sign);
				}
			});
			break;
		#endregion
		
		#region Default Locked Door Dialog
		case "demo_locked_door_but_soon":
			scr_text("It's locked and closed.", "", 1, obj_interaction_follow);
			scr_text("I'm sure it will open up soon.", "", 1, obj_interaction_follow);
			scr_text("In the *future*, it will definitely open.", "", 1, obj_interaction_follow);
			break;
		
		case "demo_locked_doorA": scr_text("It's forever locked.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorB": scr_text("It won't open.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorC": scr_text("It's shut closed.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorD": scr_text("The door is not open.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorE": scr_text("It's a door. You don't really feel like opening it.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorF": scr_text("This door is open.\n...No, wait, it's closed.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorG": scr_text("Closed doors are neat. Try imagining what's inside.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorH": scr_text("A closed door is a closed door.", "", 1, obj_interaction_follow); break;
		case "demo_locked_doorI": scr_text("It's clearly open, yet you don't feel like entering.", "", 1, obj_interaction_follow); break;
		#endregion
		
		#region MAIN ROAD
		
		#region demo_parkinglot_sign
		case "demo_parkinglot_sign":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("“Public parking available at...”");
			scr_text("The marked times are illegible.");
			break;
		#endregion
		#region demo_street_legend
		case "demo_street_legend":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("↑ “Road #2”\n" +
					 "← “Bus Stop”\n" +
					 "→ “School”");
			break;
		#endregion
		#region demo_cafe_entrance
		case "demo_cafe_entrance":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("“Café Here”");
			break;
		#endregion
		
		#endregion
		
		#region CAFE HERE
		
		#region demo_cafe_welcome_sign1 (With Costel Monolog)
		case "demo_cafe_welcome_sign1":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("“WELCOME TO\nCAFÉ HERE <3”");
			scr_text("“Today's special:\n–Fruit Bowls :>”");
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1, obj_player);
			scr_set_portrait(spr_portrait_costelA, 2, 2);
			scr_text("What a silly name for a cafe.");
			scr_set_portrait(spr_portrait_costelA, 0, 2);
			scr_text("“Café Here”, heh.");
			break;
		#endregion
		#region demo_cafe_welcome_sign2
		case "demo_cafe_welcome_sign2":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("“WELCOME TO\nCAFÉ HERE <3”");
			scr_text("“Today's special:\n–Fruit Bowls :>”");
			break;
		#endregion
		
		#region demo_cafe_locked_door
		case "demo_cafe_locked_door":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("They're closed right now.");
			scr_text("It's probably too early in the morning....");
			break;
		#endregion
		
		#region demo_cafe_menu_sign
		case "demo_cafe_menu_sign":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("It's a long list, full of an assortment of food.");
			scr_text("...Oh! They have bagel sandwiches here!");
			break;
		#endregion
		
		#endregion
		
		#region ROAD #2
		
		#region demo_road2_vinyl_sign1 (With Costel Monolog)
		case "demo_road2_vinyl_sign1":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("“NEW Vinyl Set”\n“Selling For 75% off!!!”");
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1, obj_player);
			scr_set_portrait(spr_portrait_costelA, 3, 0);
			scr_text("Wow, that's a good deal.");
			scr_set_portrait(spr_portrait_costelA, 2, 0);
			scr_text("I know Szilv’ would LOVE this.");
			break;
		#endregion
		#region demo_road2_vinyl_sign2
		case "demo_road2_vinyl_sign2":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("“NEW Vinyl Set”\n“Selling For 75% off!!!”");
			break;
		#endregion
		
		#endregion
		
		#region HOUSING HALL SIGNS
		
		case "demo_housing_sign_room1": scr_text("\n“Room 101”", "", 1, obj_interaction_follow); break;
		case "demo_housing_sign_room2": scr_text("\n“Room 102”", "", 1, obj_interaction_follow); break;
		case "demo_housing_sign_room3": scr_text("\n“Room 208”", "", 1, obj_interaction_follow); break;
		case "demo_housing_sign_room4": scr_text("\n“Room 209”", "", 1, obj_interaction_follow); break;
		
		#endregion
		
		#region Room 209 Text - demo_flute_door_hint
		case "demo_flute_door_hint1":
			scr_text_values("", 1, obj_interaction_follow);
			//scr_text("“To whom it may concern regarding the instruments for the concert...”");
			scr_text("\n“Doors Of Wind And Whistle”");
			break;
		case "demo_flute_door_hint2":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("\n“Doors Of Wind And Whistle”");
			
			if (instance_exists(obj_flute_door)) {
				if (obj_flute_door.command != "warp") {
					scr_text_values("", 1, obj_flute_door);
					scr_text("...The door frame at the back wall, try something.");
				}
			}
			break;
		case "demo_flute_door_hint3":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("\n“Doors Of Wind And Whistle”");
			
			if (instance_exists(obj_flute_door)) {
				if (obj_flute_door.command != "warp") {
					scr_text_values("", 1, obj_flute_door);
					scr_text("Tell me, what needs wind to create a whistle sound?");
				}
			}
			break;
		case "demo_flute_door_hint4":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("\n“Doors Of Wind And Whistle”");
			
			if (instance_exists(obj_flute_door)) {
				if (obj_flute_door.command != "warp") {
					scr_text_values("", 1, obj_flute_door);
					scr_text("Try something, your flute, perhaps.");
				}
			}
			break;
		case "demo_flute_door_hint5":
			if (instance_exists(obj_flute_door) && obj_flute_door.command != "warp") {
				scr_text_values("", 1, obj_flute_door);
				scr_text("...Costel, use your flute. Please.");
			} else {
				scr_text_values("", 1, obj_interaction_follow);
				scr_text("\n“Doors Of Wind And Whistle”");
			}
			break;
		#endregion
		
		#region Demo Ornate Doors - demo_ornate_door
		case "demo_ornate_door1":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("Oh, what a lovely pair of doors right here!");
			scr_text("It’s a shame – their knobs appear to be non-existent.");
			break;
		case "demo_ornate_door2":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("...Might have to return some other time.");
			break;
		case "demo_ornate_door3":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("The doors will be here,");
			scr_text("All until you return here soon again.");
			scr_text("The conditions right now may not be best for that “again” to constitute anyways.");
			break;
		#endregion
		
		#region SCHOOL GATE
		
		#region Gate Door
		#region Locked
		case "school_gate_locked1":
			scr_text_values("", 1);
			scr_text("The gate is looming beyond you.");
			scr_text("It's entrance remains locked.");
			break;
		case "school_gate_locked2":
			scr_text_values("", 1);
			scr_text("The entrance is locked.");
			scr_text("It could, perhaps, need a key of some sort.");
			break;
		#endregion
		#region Unlocked
		case "school_gate_unlocked":
			scr_text_values("", 1);
			scr_text("With the gate key in hand, it grants you entrance.");
			break;
		#endregion
		#endregion
		
		#region demo_schoolgate_keyhint
		case "demo_schoolgate_keyhint":
			//scr_text_values("");
			scr_text("“****TO ALL STUDENTS & FACULTY****”\n\n" + 
					 "“Please stop hidding the keys to the gate.”")
			scr_text("“We have a concert happening next month and we are already on our 9th key lost since September.”");
			scr_text("“To anyone who happens to finds any prior keys or happens to return them, it would be greatly appreciated.”");
			scr_text("\n“Sincerely,\n\n The School Board”");
			
			//"“Due to [] out of school hours, we decided to put this big gate here." +
			// Script to add the document. About it.
			
			break;
		#endregion
		
		#endregion
		
		#endregion
		
		#region MAIN EVENT
		
		#region School
		#region demo_fake_fence
		case "demo_fake_fence":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("This fence seems out of place....");
			break;
		#endregion
		#region demo_start_of_creature_scene
		case "demo_start_of_creature_scene":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("...");
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1, obj_player);
			scr_set_portrait(spr_portrait_costelA, 8, 1);
			scr_text("(Why is it locked?)");
			
			scr_set_typer_sound(snd_voice_creature, 1, 0.2, 0.7);
			scr_text_values("???", 1, obj_fake_fence_door);
			scr_set_portrait(spr_portrait_creature, 0, 2);
			scr_text("Happiness is always the right choice.");
			scr_text_function_start_page(function() {
				obj_player.image_xscale = -1;
				global.flag[1] = true;
			});
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1, obj_player);
			scr_set_portrait(spr_portrait_costelA, 8, 1, false);
			scr_text("(.....)");
			break;
		#endregion
		#region demo_creature_scene_b
		case "demo_creature_scene_b":
			scr_set_typer_sound(snd_voice_creature, 1, 0.2, 0.7);
			scr_text_values("???", 1, obj_creature_cutscene);
			scr_set_portrait(spr_portrait_creature, 0, 2, false);
			scr_text("The pills tried to make happiness.");
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1, obj_player);
			scr_set_portrait(spr_portrait_costelB, 8, 1);
			scr_text("(...? What point are they trying to make?)");
			scr_text_function_end_page(function() {
				global.flag[2] = true;
				if (instance_exists(obj_creature_cutscene)) {
					obj_creature_cutscene.gonna_delete = true;
				}
			});
			
			break;
		#endregion
		#region demo_save_no_turning_back
		case "demo_save_no_turning_back":
			scr_text_values("", 1, obj_interaction_follow);
			scr_text("No turning back after this.");
			scr_text("Proceed with caution.");
			scr_text_function_end_page(function() { scr_save_menu(); });
			break;
		#endregion
		#endregion
		
		#region The Finale
		
		case "demo_creature_scene_final":
			
			scr_set_typer_sound(snd_voice_creature, 1, 0.2, 0.7);
			scr_text_values("???", 1);
			scr_set_portrait(spr_portrait_creature, 0, 1, false);
			scr_text("Don't you want\nto be\nHAPPY?");
			scr_text_function_start_page(function() { obj_creature_actual.image_xscale = -1; });
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1);
			scr_set_portrait(spr_portrait_costelB, 8, 1);
			scr_text("(...)");
			
			scr_set_typer_sound(snd_voice_creature, 1, 0.2, 0.7);
			scr_text_values("???", 1);
			scr_set_portrait(spr_portrait_creature, 2, 1, false);
			scr_text("Costel...");
			scr_set_portrait(spr_portrait_creature, 3, 1, false);
			scr_text("Can you make us happy?");
			scr_text_function_drawn_text(14, function() { obj_creature_actual.anim_state = 1; });
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1);
			scr_set_portrait(spr_portrait_costelB, 9, 0);
			scr_text(".........");
			
			scr_set_typer_sound(snd_voice_creature, 1, 0.2, 0.7);
			scr_text_values("???", 1);
			scr_set_portrait(spr_portrait_creature, 5, 1, false);
			scr_text("You're always around the place...");
			scr_set_portrait(spr_portrait_creature, 6, 1, false);
			scr_text("Like its a home for you.");
			scr_set_portrait(spr_portrait_creature, 5, 1, false);
			scr_text("You know we always have your best interest in mind.");
			scr_text("I'm certain Rianne would agree.");
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1);
			scr_set_portrait(spr_portrait_costelB, 10, 0);
			scr_text("...");
			
			scr_set_typer_sound(snd_voice_creature, 1, 0.2, 0.7);
			scr_text_values("???", 1);
			scr_set_portrait(spr_portrait_creature, 3, 1, false);
			scr_text("Don't you wish to be happy, Costel?");
			scr_set_portrait(spr_portrait_creature, 5, 1, false);
			scr_text("I see it in your face.");
			scr_set_portrait(spr_portrait_creature, 4, 1, false);
			scr_text("What is your answer, Red?");
			
			txt_pre_costel_sound();
			scr_text_values("Costel", 1);
			scr_set_portrait(spr_portrait_costelB, 12, 1);
			scr_text("...");
			scr_set_portrait(spr_portrait_costelB, 11, 0);
			scr_text(".....");
			scr_set_portrait(spr_portrait_costelB, 11, 1);
			scr_text("Yes....");
			scr_text("Yes, I do want to be happy.");
			scr_set_portrait(spr_portrait_costelB, 11, 2);
			scr_text("Just let me be happy, alright?");
			
			scr_set_typer_sound(snd_voice_creature, 1.2, 0.2, 0.7);
			scr_text_values("A Gateway", 1);
			scr_set_portrait(spr_portrait_creature, 1, 0, false);
			scr_text("May you be happy and everything more.\n:)");
			scr_text_function_start_page(function() { obj_creature_actual.anim_state = 4; });
			
			scr_clear_typer_sound();
			scr_text_values("", 1);
			scr_clear_portrait();
			scr_text("Thanks for playing...");
			// Not enough time to do the loop tbh
			scr_text_function_end_page(function() { warp_player(rm_title_screen, 0, 0, 0); });
			break;
		
		#endregion
		
		#endregion
		
		#endregion
		
		
		
		
		
		
		
		#region DEFAULT TEXT
		// Used incase it doesn't point to anything.
		default:
			if (drt_game_text(_text_id) == false) {
				scr_text("***********************************\n\n" +
						 "   !!! An error has occured. !!!   \n\n" +
						 "***********************************");
				scr_text("ISSUE: NULL OR INVALID ID POINTER\n" +
						 "  *  If you are seeing this, then something went wrong or this textbox wasn't set up properly.\n" +
						 ":/");
				scr_text("  *  If you are not a dev, please report this bug to a dev.");
				scr_text("  *  If you are a dev, please report this bug to yourself.");
			}
		#endregion
	}
	
}







