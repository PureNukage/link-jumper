onGround = true
ground = y
grav = 0.4
jump = 0
hspd = 0
vspd = 0
running = true
damaged = false
damagedTimer = -1
alive = true
depth = -2

bounceDirection = -1
bounceForce = -1

function bounce() {
	
	if bounceForce > 0 {
		x += lengthdir_x(bounceForce, bounceDirection)
		y += lengthdir_y(bounceForce, bounceDirection)
		bounceForce -= 0.4	
	} else {
		bounceForce = -1
		bounceDirection = -1
	}
	
}

function bounceSet(Direction, force) {
	
	bounceDirection = Direction
	bounceForce = force
}