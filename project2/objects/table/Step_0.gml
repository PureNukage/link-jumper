var oldMask = sergey.mask_index
sergey.mask_index = sergey.sprite_index
if place_meeting(x,y,sergey) and input.keyInteraction {
	gui.showPC = !gui.showPC
}
sergey.mask_index = oldMask

depth = -y