waveY = wave(y-15,y+15,1,2)

depth = -(y + 25)

if point_distance(x,y, player.x,player.y) < 50 {
	
	if !closeInteract closeInteract = true
	
	if !gui.showInteract gui.showInteract = true
	
	if input.keyInteraction {
		gui.setMessage("You have acquired the God Protocols!", 90)
		if gui.showInteract gui.showInteract = false
		instance_create_layer(1962,411,"Instances",zone)
		instance_destroy()
	}	
	
}

else if closeInteract {
	if gui.showInteract gui.showInteract = false
}