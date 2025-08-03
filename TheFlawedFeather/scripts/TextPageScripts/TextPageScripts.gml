
#region Page Functions
/// Needed to add a setup page for usage.
/// The page only finally increments after doing the text command.
/// 0 for the start of it (default), "page_number" when preparing to go to the next page.
function textbox_page_check(_page_val_check = 0) {
	if (array_length(page_array) == _page_val_check) {
		textbox_page_add();
	}
}
function textbox_page_add() {
	array_push(page_array, new textbox_create_page());
	textbox_page_inherit_last();
}
/// Whatever is the last page in the array will get most values from the prior page.
/// Excluded Values:  text, options, scripts
/// Included Values:  box, name, portraits, typer
function textbox_page_inherit_last() {
	if (array_length(page_array) > 1) {
		var _from = page_array[array_length(page_array) - 2];
		var _to = page_array[array_length(page_array) - 1];
		
		_to.box = _from.box;
		_to.name = _from.name;
		_to.portraits = _from.portraits;
		_to.typer = _from.typer;
		
		page_array[array_length(page_array) - 1] = _to;
	}
}
#endregion


function textbox_add_text(_text, _col = c_white, _alpha = 1) {
	textbox_page_check(page_number);
	
	//page_array[page_number].text.text = _text;
	//array_last(page_array).text.text = _text;
	array_push(array_last(page_array).text, new textbox_create_text_data(_text));
	
	page_number++;
	//textbox_page_add();
}
function textbox_add_text_ext(_text, _col, _alpha = 1) {
	textbox_page_check(page_number);
	
	array_last(page_array).text.text = _text;
	array_last(page_array).text.color = _col;
	array_last(page_array).text.alpha = _alpha;
	
	array_push(array_last(page_array).text, new textbox_create_text_data(_text, _col, _alpha));
	
	page_number++;
}
function textbox_add_text_pos(_x, _y) {
	textbox_page_check(page_number);
	
	array_last(page_array).text.pos.x = _x;
	array_last(page_array).text.pos.y = _y;
	
}


#region Name Add
function textbox_add_name(_name, _col = c_outp_orange, _text_alpha = 1, _box_alpha = 1) {
	textbox_page_check();
	array_last(page_array).name.text = _name;
	array_last(page_array).name.color = _col;
	array_last(page_array).name.text_alpha = _text_alpha;
	array_last(page_array).name.box_alpha = _box_alpha;
}
function textbox_add_name_pos(_x, _y) {
	textbox_page_check();
	array_last(page_array).name.pos.x = _x;
	array_last(page_array).name.pos.y = _y;
}
#endregion