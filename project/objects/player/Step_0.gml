if keyboard_check_pressed(ord("W")) and y == ground {
	//show_debug_message("jumping!")
	vspd = -15
}

if keyboard_check_pressed(vk_control) god = !god

if keyboard_check_pressed(ord("S")) {
	vspd = 15
}	

if y != ground vspd = vspd + grav

repeat abs(vspd) {
	var newY = y
	newY += sign(vspd)
	//show_debug_message("newY: "+string(newY))
	if newY <= ground {
		y += sign(vspd)
	} else {
		//show_debug_message("landed at: "+string(y))
		vspd = 0	
	}
}

if vspd < 0 {
	sprite_index = s_sergey_jump0	
} else if vspd > 0 { 
	sprite_index = s_sergey_jump1	
} else {
	sprite_index = s_sergey_run	
}


if instance_place(x+1,y,obstacle) and god == 0 {
	game_restart()	
}