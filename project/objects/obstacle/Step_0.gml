x -= 7

if y != ground vspd = vspd + grav

if bounce == 1 and y == ground {
	vspd = -15	
}

repeat abs(vspd) {
	var newY = y
	newY += sign(vspd)
	if newY <= ground {
		y += sign(vspd)
	} else {
		vspd = 0	
	}
}