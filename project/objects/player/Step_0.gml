if keyboard_check_pressed(ord("W")) and y == ground {
	//show_debug_message("jumping!")
	vspd = -15
}

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

if instance_place(x+1,y,obstacle) {
	game_restart()	
}