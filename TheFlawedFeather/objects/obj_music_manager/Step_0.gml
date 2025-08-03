
if (timer > 0) {
	timer--;
	max_volume = 0;
} else {
	max_volume = 0.5;
}
volume += calc_compare_divide(volume, max_volume, 25);

audio_sound_gain(1, volume, 1000);
//var o = audio_get_master_gain(1);

if (
	timer <= 0 &&
	current_song != held_song
) {
	current_song = held_song;
	audio_stop_all();
	audio_play_sound(current_song, 1, true, 0.5);
}




