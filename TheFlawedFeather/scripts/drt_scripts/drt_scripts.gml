// DELTARUNE TOMORROW

function drt_spawn_explosion(_obj) {
	
	if (!instance_exists(_obj)) _obj = obj_player;
	
	instance_create_depth(_obj.x, _obj.y, _obj.depth - 1, drt_obj_explosion);
	audio_play_sound(drt_snd_explosion, 15, false);
}

function drt_pre_susie_sound() {
	scr_set_typer_sound(drt_snd_talk_susie, 1, 0, 1.5);
}
function drt_pre_susie_portrait_and_sound(_x, _y) {
	drt_pre_susie_sound();
	scr_set_portrait(drt_spr_portrait_susie, _x, _y, false);
}

function drt_scr_collide_block_functions(_id) {
	switch (_id) {
		case "deltarune_start":
			create_textbox("deltarune_start");
			break;
		case "deltarune_interaction":
			create_textbox("deltarune_interaction");
			break;
		default: // do nothing
	}
}

function drt_game_text(_text_id) {
	switch (_text_id) {
		case "deltarune_start":
			scr_text_values("???", 1, drt_obj_susie);
			drt_pre_susie_sound();
			scr_text("* Kris!");
			break;
	
		case "deltarune_interaction":
			scr_text_values("???", 1, drt_obj_susie);
			drt_pre_susie_portrait_and_sound(3, 3);
			scr_text("* God damn it Kris!\n* Where the hell are we?");
			scr_text_function_drawn_text(2, function() {
				drt_obj_susie.image_index = 1;
			});
			scr_text_function_drawn_text(19, function() { drt_obj_kris.image_xscale = -1; });
			
			scr_text_values("Costel", 1, obj_player);
			txt_pre_costel_sound_and_portrait(0, 0);
			scr_text("...?");
			
			scr_clear_portrait();
			scr_clear_typer_sound();
			scr_text_values("", 1, drt_obj_kris);
			scr_text("“Kris” seems to notice your presence.");
			scr_text_function_drawn_text(0, function() { drt_obj_susie.image_index = 0;	});
			scr_text_function_drawn_text(25, function() { drt_obj_susie.image_xscale = -1; });
			
			scr_text_values("???", 1, drt_obj_susie);
			drt_pre_susie_portrait_and_sound(0, 3);
			scr_text("* Oh, hey, do you know where we are right now?");
			
			scr_text_values("Costel", 1, obj_player);
			txt_pre_costel_sound_and_portrait(1, 0);
			scr_text("Oh. Uh...");
			txt_pre_costel_sound_and_portrait(2, 1);
			scr_text("I mean, we're in a town right now...");
			scr_text_function_start_page(function() { obj_player.image_xscale = -1; });
			scr_text_function_end_page(function() { obj_player.image_xscale = 1; });
			
			scr_text_values("???", 1, drt_obj_susie);
			drt_pre_susie_portrait_and_sound(1, 3);
			scr_text("* Yeah, but WHERE exactly?");
			scr_text_function_drawn_text(0, function() { drt_obj_susie.image_xscale = 1; });
			scr_text_function_drawn_text(17, function() { drt_obj_susie.image_xscale = -1; });
			
			scr_text_values("Costel", 1, obj_player);
			txt_pre_costel_sound_and_portrait(0, 1);
			scr_text("Um...");
			txt_pre_costel_sound_and_portrait(7, 0);
			scr_text("I'm sorry, wait...");
			txt_pre_costel_sound_and_portrait(7, 1);
			scr_text("Who exactly are you people, by the way?");
			txt_pre_costel_sound_and_portrait(0, 0);
			scr_text("Like, why are you here exactly?");
			
			scr_clear_portrait();
			scr_clear_typer_sound();
			scr_text_values("", 1, drt_obj_kris);
			scr_text("They say something along the lines...");
			scr_text_function_start_page(function() { drt_obj_susie.image_xscale = 1; });
			
			scr_text("“Deltarune tomorrow”?");
			scr_text_function_drawn_text(1, function() { drt_spawn_explosion(drt_obj_kris); });
			
			scr_text_values("Costel", 1, obj_player);
			txt_pre_costel_sound_and_portrait(0, 1);
			scr_text("... What?");
			scr_text_function_drawn_text(4, function() { drt_obj_susie.image_xscale = -1; });
			
			scr_text_values("???", 1, drt_obj_susie);
			drt_pre_susie_portrait_and_sound(2, 3);
			scr_text("* You heard them, “Deltarune tomorrow.”");
			scr_text_function_drawn_text(19, function() { drt_spawn_explosion(drt_obj_susie); });
			
			scr_text_values("Costel", 1, obj_player);
			txt_pre_costel_sound_and_portrait(8, 1);
			scr_text("...");
			txt_pre_costel_sound_and_portrait(3, 0);
			scr_text("-Wait, for real?");
			txt_pre_costel_sound_and_portrait(3, 2);
			scr_text("Deltarune tomorrow?!");
			scr_text_function_drawn_text(1, function() { drt_spawn_explosion(obj_player); });
			
			scr_text_values("Susie", 1, drt_obj_susie);
			drt_pre_susie_portrait_and_sound(2, 3);
			scr_text("* Yeah, for real!\n* Deltarune tomorrow!!");
			scr_text_function_drawn_text(19, function() { drt_spawn_explosion(drt_obj_kris); });
			scr_text_function_drawn_text(29, function() { drt_spawn_explosion(drt_obj_susie);});
			
			scr_text_values("Costel", 1, obj_player);
			txt_pre_costel_sound_and_portrait(3, 2);
			scr_text("YIPPIEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
			scr_text_function_drawn_text(5, function() {
				drt_spawn_explosion(drt_obj_susie);
				drt_spawn_explosion(drt_obj_kris);
				drt_spawn_explosion(obj_player);
			});
			
			break;
		default:
			return false;
	}
}