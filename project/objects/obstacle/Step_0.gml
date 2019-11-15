if time.stream - spawn_time == 1 {
	if sprite_index == s_fist {
		var _choose = choose(s_fist,s_rockstar)
		sprite_index = _choose
	}
	
	if sprite_get_number(sprite_index) > 1 {
		var _random_frame = irandom_range(0,sprite_get_number(sprite_index))
		image_index = _random_frame
	}
}

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