y = wave(floatY - 20, floatY + 20, .5, 0)

if place_meeting(x,y,player) {
	player.hasWrench = true
	instance_destroy()
}