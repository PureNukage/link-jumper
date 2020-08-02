waveY = wave(y-15,y+15,1,2)

depth = -(y + 25)

if point_distance(x,y, player.x,player.y) < 50 {
	
	if !closeInteract closeInteract = true
	
	if !gui.showInteract gui.showInteract = true
	
	if input.keyInteraction {
		show_message("You have acquired the God Protocols!\nGame Over!")
		game_end()
	}	
	
}

else if closeInteract {
	if gui.showInteract gui.showInteract = false
}