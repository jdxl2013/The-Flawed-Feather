
// DIRECTORY SET UP
var _directory_name = working_directory;
//"Outpatient";
if !directory_exists(_directory_name) {
	directory_create(_directory_name);
}
show_debug_message("\n\nNAME: " + string(_directory_name) + "\n\n");

global.font_main = FONT;