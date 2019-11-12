var volume_change = keyboard_check(vk_pageup) - keyboard_check(vk_pagedown)
volume_change = volume_change / 10

var current_volume = audio_sound_get_gain(song)
if current_volume + volume_change > 0 and current_volume + volume_change < 1 {
	audio_sound_gain(song,current_volume+volume_change,0)
}