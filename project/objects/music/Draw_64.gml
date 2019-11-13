if volume == 0 {
	var _sprite = s_audio_off	
} else { 
	var _sprite = s_audio_on
}

draw_sprite(_sprite,0,volume_icon_x,volume_icon_y)