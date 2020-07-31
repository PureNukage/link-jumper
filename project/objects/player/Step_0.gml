//	Jump
//	Charge
if (input.action_press) and y == ground and music.moused_over == false {
	vspd = -10
	jump = 8
}
if (input.action) and (jump > 0 and jump < 5) {
	vspd--
}
if jump > 0 jump--

//hspd = (keyboard_check(ord("D")) - keyboard_check(ord("A")))*6
//x += hspd
//x = clamp(x,160,255)

//	Running score
running_score_frame++
if running_score_frame >= 5 {
	running_score_frame = 0
	running_score++
}

//	God Mode Toggle
//if keyboard_check_pressed(vk_control) god = !god


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
if instance_place(x,y,obstacle) and god == 0 and damaged == 0 {
	var _obstacle = instance_place(x,y,obstacle)
	if _obstacle.sprite_index == s_chainlink {
		if vspd > 0 {
			//hp++
			//hp = clamp(hp,0,hp_max)
			instance_destroy(_obstacle)
			vspd = -15
		} else {
				
		}
	} else {
		hp--
		damaged = 45
	}
}

////	Bouncing off Chainlink cube
//if instance_place(x,y+2,obstacle) and vspd < 0 {
//	var Obstacle = instance_place(x,y+2,obstacle)
//	if Obstacle.sprite_index == s_chainlink vspd += 10
//}

//	Game Over
if hp <= 0 {
	//	Game over state
	with all {
		if object_index != music {
			instance_destroy()	
		}
	}
	instance_create_layer(1086,576,"Instances",pepevan)
	var _gameover = instance_create_layer(0,0,"Instances",gameover)
	_gameover.running_score = running_score
}