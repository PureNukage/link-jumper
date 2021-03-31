timerMax = 120
timer = 0
stage = 0

height1 = room_height/2-200
height2 = height1 + 400

used = false

function _elevator() {
	switch(stage) {
		//	Slide from top to middle
		case 0:
			y += 2
			if y >= height1 {
				y = height1
				stage = 1
			}
		break
		//	Pause
		case 1:
			timer++
			if timer >= timerMax {
				stage = 2	
			}
		break
		//	Slide from middle to bottom
		case 2:
			y += 2
			if y >= height2 {
				if !used app.switch_room(Room5)
				used = true
			}
		break
	}
}