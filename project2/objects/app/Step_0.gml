//if chapter3active {
	//	Chapter 3 Timer
	if time.minutes_switch chapter3_timer--

	//	Restart game
	if chapter3_timer < 0 {
		gameOver = true
	}

	var Seconds = string(60 - time.seconds)
	var Minutes = string(app.chapter3_timer)
	if (60-time.seconds) < 10 {
		var Seconds = "0" + string(60 - time.seconds)	
	}
	if (60-time.seconds) == 60 {
		var Seconds = "00"	
		var Minutes = string(app.chapter3_timer + 1)
	}

	if app.gameOver {
		Minutes = "0"
		Seconds = "00"
	}

	var Time = Minutes + ":" + Seconds
	////	Music
	//	Track A
	if Time == "0:50" and !audio_is_playing(snd_trackA) {
		//	Disable other music if its playing
		if audio_is_playing(snd_music) audio_stop_sound(snd_music)
		if audio_is_playing(snd_music_2) audio_stop_sound(snd_music_2)
		if !audio_is_playing(snd_trackB) audio_play_sound(snd_trackA, 0, false)
	}
	//	Track B
	if room == Room5 and !audio_is_playing(snd_trackB) and !gameDone {
		//	Disable other music if its playing
		if audio_is_playing(snd_music) audio_stop_sound(snd_music)
		if audio_is_playing(snd_music_2) audio_stop_sound(snd_music_2)
		if audio_is_playing(snd_trackA) audio_stop_sound(snd_trackA)
		audio_play_sound(snd_trackB,0,true)
	}


	if input.keySpeedMinute chapter3_timer--
//}