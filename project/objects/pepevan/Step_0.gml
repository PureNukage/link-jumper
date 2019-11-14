switch(states)
{
	case 0:	//	Back into camera view
	
		if distance_to_point(goalX,y) > 20 {
			x = lerp(x,goalX,0.03)
		} else {
			timer = 120
			states = 1	
		}
	
	
	break
	case 1:	//	Laughter
	
		laugh_frame++
	
		if laugh_frame >= 2 {
			laugh++	
			laugh_frame = 0
		}
	
		if laugh > 2 laugh = 0
		
		if timer > 0 timer--
		else {
			states = 2
			goalX = room_width+800
		}	
	
	break
	case 2:	//	Speed away
	
		if distance_to_point(goalX,y) > 20 {
			x = lerp(x,goalX,0.03)
		} else {
			instance_destroy()
		}
	
	break
	case 3:
	
	break
}