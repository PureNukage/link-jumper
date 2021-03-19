var oldMask = sergey.mask_index
sergey.mask_index = sergey.sprite_index
if place_meeting(x,y,sergey) {
	interaction = true
	if input.keyInteraction {
		gui.showPC = !gui.showPC
	}
}
else if interaction interaction = false
sergey.mask_index = oldMask

depth = -y