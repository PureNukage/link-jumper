if game_start == false { 
	if point_in_rectangle(mouse_x,mouse_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		button_mouseover = true
		button_color = color_button_highlight
	
		//	If leftclick
		if mouse_check_button(mb_left) {
		
			game_start = true
			sprite_index = s_sergey_run
			x = player_xpos
			y = player_ypos

		}	
	
	} else {
		button_mouseover = false
		button_color = color_button_normal
	}
	
	
} else {
	
	if distance_to_point(player_game_xpos,player_game_ypos) > 10 { 
		x = lerp(x,player_game_xpos,.03)		
	} else {
		instance_create_layer(0,0,"Instances",time)
		var _player = instance_create_layer(x,player_game_ypos,"Instances",player)
		_player.image_index = image_index
		instance_create_layer(1248,576,"Instances",spawner)
		if instance_number(music) == 0 {
			var _music = instance_create_layer(0,0,"Instances",music)
			_music.volume = volume
			audio_sound_gain(song,volume,0)
		}
		instance_destroy()
			
	}
	
}

//	Volume check
if point_in_rectangle(mouse_x,mouse_y,volume_icon_x,volume_icon_y,volume_icon_x+64,volume_icon_y+64) {
	if mouse_check_button_pressed(mb_left) {
		if volume > 0 {
			volume_old = volume
			volume = 0
			exit
		} else if volume == 0 {
			volume = volume_old
		}	
	}
}