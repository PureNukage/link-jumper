if game_start == false { 
	if point_in_rectangle(mouse_x,mouse_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
		button_mouseover = true
		button_color = c_dkgray
	
		//	If leftclick
		if mouse_check_button(mb_left) {
		
			game_start = true
			sprite_index = s_sergey_run
			x = player_xpos
			y = player_ypos

		}	
	
	} else {
		button_mouseover = false
		button_color = c_gray
	}
} else {
	
	if distance_to_point(player_game_xpos-63,player_game_ypos) > 1 { 
		x = lerp(x,player_game_xpos-63,.03)		
	} else {
		instance_create_layer(0,0,"Instances",time)
		instance_create_layer(x,player_game_ypos,"Instances",player)
		instance_create_layer(1248,576,"Instances",spawner)
		instance_destroy()
			
	}
	
	
}