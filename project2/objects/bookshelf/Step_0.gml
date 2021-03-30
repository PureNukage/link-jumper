if !opened {
	var oldMask = sergey.mask_index
	sergey.mask_index = sergey.sprite_index
	if place_meeting(x,y,sergey) {
		interaction = true
		if input.keyInteraction {
			gui.showBookshelf = !gui.showBookshelf
		}
	}
	else if interaction interaction = false
	sergey.mask_index = oldMask
}
else interaction = false

//	Bookshelf open
if gui.books_array[12] and gui.books_array[16] and !opened {
	if gui.showBookshelf gui.showBookshelf = false
	opening = true
	opened = true
}

depth = -y

if opening _open()