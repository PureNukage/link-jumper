if browser_width != width or browser_height != height {
	width = min(base_width,browser_width)
    height = min(base_height,browser_height)
    scale_canvas(base_width,base_height,width,height,true)
	display_set_gui_size(base_width,base_height)
}	