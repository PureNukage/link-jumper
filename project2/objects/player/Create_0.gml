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
xx = 0
yy = 0

zoneJumping = -1
zoneJumpingTimer = -1

fallingAlpha = 0
fallingColor = c_yellow
fallingStage = 0
fallingTimer = -1

seenStation = false
atStation = false
hasWrench = false
stationTimer = -1

done = false

fallRadius = 1

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
	
function applyMovementAndCollide() {
	
	if xx != 0 or yy != 0 {
		
		for(var X = 0; X < abs(xx); X++) {
			if !place_meeting(x + sign(xx), y, collision) {
				x += sign(xx)
			}
			else {
				//	Move up slope
				if !place_meeting(x + sign(xx), y-1, collision) y--
				else if !place_meeting(x + sign(xx), y-2, collision) y -= 2
				else if !place_meeting(x + sign(xx), y-3, collision) y -= 3
				
				//	Move down slope
				if !place_meeting(x + sign(xx), y+1, collision) y++
				else if !place_meeting(x + sign(xx), y+2, collision) y += 2
				else if !place_meeting(x + sign(xx), y+3, collision) y += 3
			}
		}
		
		for(var Y = 0; Y < abs(yy); Y++) {
			if !place_meeting(x, y + sign(yy), collision) y += sign(yy)
		}
		
		xx = 0
		yy = 0
	}
	
}