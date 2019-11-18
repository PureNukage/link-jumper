var volume_change = keyboard_check(vk_pageup) - keyboard_check(vk_pagedown)
volume_change = volume_change / 10

var current_volume = audio_sound_get_gain(song)
if keyboard_check(vk_pageup) or keyboard_check(vk_pagedown) {
	//if current_volume + volume_change > -0.05 and current_volume + volume_change < 1.05 {
		volume = current_volume + volume_change
		volume = clamp(volume,0,1)
		audio_sound_gain(song,volume,0)
	//}
}

if point_in_rectangle(mouse_x,mouse_y,volume_icon_x,volume_icon_y,volume_icon_x+64,volume_icon_y+64) {
	moused_over = true
	if mouse_check_button_pressed(mb_left) {
		if volume > 0 {
			volume_old = volume
			volume = 0
			audio_sound_gain(song,volume,0)
			exit
		} else if volume == 0 {
			volume = volume_old
		}	
		audio_sound_gain(song,volume,0)
	}
} else {
	moused_over = false	
}