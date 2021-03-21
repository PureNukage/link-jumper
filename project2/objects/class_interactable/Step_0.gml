//if gui.interacting == id and point_distance(x,y, sergey.x,sergey.y) <= radius {
if gui.interacting == id and point_in_circle(sergey.x,sergey.y,x,y,radius) {
	interaction = true
	if input.leftPress {
		interacted = true
	}
	else if interacted interacted = false
}
else {
	interaction = false
	if interacted interacted = false
	//if input.leftPress and point_distance(x,y, sergey.x,sergey.y) > radius {
	//if input.leftPress and !point_in_circle(sergey.x,sergey.y,x,y,radius) {
	//	sergey.setMessage("I need to be closer")	
	//}
}