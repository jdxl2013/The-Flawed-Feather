
function set_song(_snd) {
	with (obj_music_manager) {
		if (current_song != _snd) {
			
			held_song = _snd;
		
			timer = time_to_set_volume;
		
			max_volume = 0;
		}
	}
	
}