var oldMask = sergey.mask_index
sergey.mask_index = sergey.sprite_index
if place_meeting(x,y,sergey) {
	interaction = true
	if input.keyInteraction and point_in_rectangle(sergey.x,sergey.y, 429,208,565,245) {
		close()
	}
}
else if interaction interaction = false
sergey.mask_index = oldMask

//	Wait for puzzle solution for elevator to rise up
if statue_0.redeye and !statue_1.redeye and !statue_2.redeye and statue_3.redeye and !used {
	used = true
	rising = true
	camera.cameraFocus(x,y, 90)
	sergey.canMove = false
}

if rising rise()

if lowering lower()

if opening _open()

if closing _close()