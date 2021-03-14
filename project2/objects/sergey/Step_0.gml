hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

if (hspd != 0 or vspd != 0) {
	var Direction = point_direction(0,0, hspd,vspd)
	
	movespeed += 0.1
	movespeed = clamp(movespeed,0,movespeedMax)
	
	xx = lengthdir_x(movespeed, Direction)
	yy = lengthdir_y(movespeed, Direction)
}
else {
	if movespeed > 0 movespeed -= 0.2
	movespeed = clamp(movespeed,0,movespeedMax)
}

if !gui.showPC applyMovement()

//	Sprite decisions
if hspd != 0 image_xscale = sign(hspd)

if hspd != 0 or vspd != 0 {
	sprite_index = s_sergey_walk	
}
else {
	sprite_index = s_sergey_idle
}

depth = -y