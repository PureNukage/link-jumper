if app.stage < 4 {
	if !audio_is_playing(snd_music) audio_play_sound(snd_music, 0, true)
	audio_sound_gain(snd_music, .5, 0)
}

music_volume = 1
music_1_loop = false
music_2_loop = false

function playSoundEffect(index) {
	var Loop = false
	if index == snd_music Loop = music_1_loop
	else Loop = music_2_loop
	
	audio_play_sound(index,0,Loop)
	audio_sound_gain(index, music_volume, 0)
}