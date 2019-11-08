//	Jump
//	Charge
if keyboard_check_pressed(ord("W")) and y == ground {
	vspd = -10
	jump = 8
}
if keyboard_check(ord("W")) and (jump > 0 and jump < 5) {
	vspd--
}
if jump > 0 jump--

//hspd = (keyboard_check(ord("D")) - keyboard_check(ord("A")))*6
//x += hspd
//x = clamp(x,160,255)


//	God Mode Toggle
if keyboard_check_pressed(vk_control) god = !god


//	Fall to Ground
if keyboard_check_pressed(ord("S")) and vspd < 0 {
	vspd = 0
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

if damaged > 0 { damaged-- image_blend = c_red } else image_blend = c_white

//	Obstacle Collision-Check
if instance_place(x+15,y,obstacle) and god == 0 and damaged == 0 {
	var _obstacle = instance_place(x+15,y,obstacle)
	if _obstacle.sprite_index == s_fud {
		hp--
		damaged = 45
	} else {
		hp++
		damaged = 45
		instance_destroy(_obstacle)
	}
}

//	Game Over
if hp <= 0 {
	game_restart()
}