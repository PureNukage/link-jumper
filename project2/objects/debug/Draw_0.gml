if on {
	
	if instance_exists(player) with player {
		draw_set_color(c_red)
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
		draw_reset()
	}
	
}