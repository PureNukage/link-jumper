if point_in_rectangle(mouse_x,mouse_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
	color_button = color_button_highlight
	if mouse_check_button_pressed(mb_left) {
		instance_create_layer(0,0,"Instances",mainmenu)
		instance_destroy()
	}
	
} else {
	color_button = color_button_normal	
}