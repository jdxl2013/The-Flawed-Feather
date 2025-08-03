/*
This contains all values needed for character portraits and audio.
Useful to prevent constant need of remembering certain values (such as pitch, variance, etc.)
If you want to override something, just apply the specific value after calling one of these.
*/

function txt_pre_costel_sound() {
	scr_set_typer_sound(snd_voice_costel, 1, 0.05, 0.7);
}

function txt_pre_costel_sound_and_portrait(_x_frame, _y_frame, _has_shadow = false) {
	txt_pre_costel_sound();
	var _portrait_set = _has_shadow ? spr_portrait_costelB : spr_portrait_costelA;
	
	scr_set_portrait(_portrait_set, _x_frame, _y_frame);
	//scr_set_portrait([new textbox_create_portrait_data(_portrait_set, _x_frame, _y_frame)]);
}