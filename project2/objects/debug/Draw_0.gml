if on {
	
	if instance_exists(player) with player {
		draw_set_color(c_red)
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
		draw_reset()
	}
	
	//	Interactable objects
	if instance_exists(class_interactable) with class_interactable {
		draw_set_color(c_red)
		draw_set_alpha(0.5)
		draw_circle(x,y,radius,false)	
	}
	
	draw_reset()
	
}