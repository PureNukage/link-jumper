interaction = false

image_speed = 0
image_index = 0 

filled = false

used = false

rising = false
function rise() {
	y -= 4
	if y <= 92 {
		rising = false
		y = 92
		var Collision = instance_create_layer(429,92,"Collision",collision)
		Collision.image_xscale = 2.187
		Collision.image_yscale = 1.859
		open()
		sergey.canMove = true
	}
}

lowering = false
function lower() {
	y += 4	
	if y >= 246 {
		lowering = false
		y = 246
	}
}

opening = false
function _open() {
	if image_index >= image_number-1 {
		opening = false
		image_index = image_number-1
		image_speed = 0
	}
}
function open() {
	image_speed = 1
	image_index = 0
	opening = true
}

closing = false
function _close() {
	if image_index >= image_number-1 {
		image_speed = 0
		image_index = image_number-1
		lowering = true
	}
}
function close() {
	sprite_index = s_elevator_close
	image_index = 0
	image_speed = 1
	closing = true
	sergey.canMove = false
	sergey.image_alpha = 0
	filled = true
}