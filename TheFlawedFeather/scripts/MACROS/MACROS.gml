
#region CAMERA & WINDOW

#macro CAMERA_WIDTH		320
#macro CAMERA_HEIGHT	180

#macro WINDOW_WIDTH		160		//	160		320		640		1280	1920
#macro WINDOW_HEIGHT	90		//	90		180		360		180		1080
#macro WINDOW_SCALE		10		//	1		2		4		8		12
// 2 is default or x1 scale
#endregion

// ***** CHECK THE get_controls(); SCRIPT *****
#region CONTROLS
/* I want to get custom controls set up but ill
have to deal with that later. 
just found out that defining macros is not with = but
by literally just spacing it out from it, idk lol but
good to know*/
/*
#macro UP			vk_up
#macro DOWN			vk_down
#macro LEFT			vk_left
#macro RIGHT		vk_right

#macro CONFIRM		ord("Z")
#macro CANCEL		ord("X")		// Also used to run.
#macro MENU			ord("C")
*/

#endregion

#region CHARACTERS

#macro PLAYER_COSTEL1	0
#macro PLAYER_COSTEL2	1
#macro PLAYER_RIANNE1	2
#macro PLAYER_RIANNE2	3
#macro PLAYER_RIANNE3	4

#endregion

#region OTHER

#macro c_outp_orange		$0068FF		// #FF6800
#macro c_outp_icon			$10184B		// #4B1810

#macro c_outp_lticon		$213196		// #963121
#macro c_outp_altorange		$3149E1		// #E14931

#macro FONT				fnt_outpatient_latin
/*
		#1C0A09		BACKGROUND		$090A1C
		#260C08						$080C26
		#4B1810		ICON
		#963121		
		#E14931		ALTERNATE ORANGE
*/

#endregion