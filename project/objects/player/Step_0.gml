//	Jump
if keyboard_check_pressed(ord("W")) and y == ground {
	vspd = -15
}


//	God Mode Toggle
if keyboard_check_pressed(vk_control) god = !god


//	Fall to Ground
if keyboard_check_pressed(ord("S")) {
	vspd = 15
}	


//	Gravity
if y != ground vspd = vspd + grav


//	Sprite Change
if vspd < 0 {
	sprite_index = s_sergey_jump0	
} else if vspd > 0 { 
	sprite_index = s_sergey_jump1	
} else {
	sprite_index = s_sergey_run	
}


#region	Vertical Collision-Check
repeat abs(vspd) {
	var newY = y
	newY += sign(vspd)
	if newY <= ground {
		y += sign(vspd)
	} else {
		vspd = 0	
	}
}
#endregion


//	Obstacle Collision-Check
if instance_place(x+1,y,obstacle) and god == 0 {
	game_restart()	
}