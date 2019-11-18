if game_start == false { 
	//	Play Button mouseover check
	if point_in_rectangle(mouse_x,mouse_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		button_mouseover = true
		button_color = color_button_highlight
	
		//	If leftclick
		if mouse_check_button(mb_left) {
		
			game_start = true
			sprite_index = s_sergey_run
			image_speed = 1.5
			x = player_xpos
			y = player_ypos

		}	
	
	} else {
		button_mouseover = false
		button_color = color_button_normal
	}
	
	//	Help Button mouseover check
	if point_in_rectangle(mouse_x,mouse_y,help_buttonX,help_buttonY,help_buttonX+button_width,help_buttonY+button_height) {
		//if help_menu_open == false {
		help_button_color = color_button_highlight	
		
		// If leftclick
		if mouse_check_button_pressed(mb_left) {
			help_menu_open = !help_menu_open
			
		}
	} else {
		if help_menu_open == false {
			help_button_color = color_button_normal	
		}
	}
	
	//	Hehe
	if point_in_rectangle(mouse_x,mouse_y,596,130,596+64,130+20) and meme == 0 {
		if mouse_check_button_pressed(mb_left) {
			meme = 1
		}
	}
	if meme > 0 meme++
	
} else {
	
	if distance_to_point(player_game_xpos,player_game_ypos) > 10 { 
		x = lerp(x,player_game_xpos,.03)		
	} else {
		instance_create_layer(0,0,"Instances",input)
		instance_create_layer(0,0,"Instances",time)
		var _player = instance_create_layer(x,player_game_ypos,"Instances",player)
		_player.image_index = image_index
		instance_create_layer(1086,576,"Instances",spawner)
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