/// @description Time Checks

draw_set_font(fnt);
var _fnt_size = font_get_size(fnt); 
//draw_set_alpha(follow.image_alpha);
draw_set_alpha(image_alpha);

#region CURRENT TIME
// current_ gives the playtime.
// I was initially gonna do my own timezone but since idk how
// to get it to establish that, I'm just doing UTC time.
if (date_get_timezone() != timezone_local)
	date_set_timezone(timezone_local);

var _date = string(date_datetime_string(date_current_datetime()));
//var _date = "11/2/2023";

#endregion

#region MAIN TEXT
draw_set_color(c_black);

draw_text_ext_transformed(
	x - (CAMERA_WIDTH / 2) + 1,
	y - (CAMERA_HEIGHT / 2),
	txt + "\n" +
	"UTC-4 > " + _date + "\n" +
	"Playtime > " + string(current_time),
	_fnt_size + 2, 2 * (CAMERA_WIDTH - 1),
	1, 1, 0);

draw_set_color(c_outp_orange);
// Orange Outpatient Color: #FF6800
// GMS2 does BGR and not RGB, odd but ok.

draw_text_ext_transformed(
	x - (CAMERA_WIDTH / 2) + 2,
	y - (CAMERA_HEIGHT / 2) + 1,
	txt + "\n" +
	"UTC-4 > " + _date + "\n" +
	"Playtime > " + string(current_time),
	_fnt_size + 2, 2 * (CAMERA_WIDTH - 1),
	1, 1, 0);
#endregion

#region CURRENT ROOM

var _current_room = string(room_get_name(room));

draw_set_color(c_black);
draw_text_ext_transformed(
	x - (CAMERA_WIDTH / 2) + 1,
	y - (CAMERA_HEIGHT / 2) - 2 + CAMERA_HEIGHT - string_height(_current_room),
	"Current Room > " + _current_room,
	_fnt_size + 2, 2 * (CAMERA_WIDTH - 1),
	1, 1, 0);

//draw_set_color(c_ltgray);
draw_set_color(c_outp_lticon);
draw_text_ext_transformed(
	x - (CAMERA_WIDTH / 2) + 2,
	y - (CAMERA_HEIGHT / 2) - 1 + CAMERA_HEIGHT - string_height(_current_room),
	"Current Room > " + _current_room,
	_fnt_size + 2, 2 * (CAMERA_WIDTH - 1),
	1, 1, 0);

#endregion


// Unties this with other text like the textbox
draw_set_color(c_white);
draw_set_alpha(1);