y = wave(floatY - 10, floatY + 10, 0.5, 0)

if place_meeting(x,y,player) {
	if player.hasWrench {
		sprite_index = s_astronautWrench	
		player.hasWrench = false
		player.stationTimer = 60
	}
}