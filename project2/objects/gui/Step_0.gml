//	Windows
//window_interaction = -1
var temp_window_interaction = -1
for(var i=1;i<20;i++) {
	//	Determine the icons
	var spriteName = "s_icon" + string(i)
	if sprite_exists(asset_get_index(spriteName)) {
		var Window = icon_array[i, icon_window]	
		if Window.open {
				
			var windowX = Window.windowX
			var windowY = Window.windowY
			var window_width = Window.window_width
			var window_height = Window.window_height
			var border = 2
			
			//	Window interaction
			if (point_in_rectangle(gui_mouse_x,gui_mouse_y, windowX,windowY,windowX+window_width,windowY+window_height) or window_offsetX != -1 or (window_width_new != -1 or window_height_new != -1)) and (window_interaction == -1 or window_interaction == i) {
				window_interaction = i
				temp_window_interaction = i
				mouseOverWindow = true
				
				//	Dragging window
				if (point_in_rectangle(gui_mouse_x,gui_mouse_y, windowX+border,windowY+border, windowX+window_width-border,windowY+24) or window_offsetX != -1) {
					mouseOverBar = true
					//	Exit
					if point_in_circle(gui_mouse_x,gui_mouse_y, windowX+window_width-19,windowY+12,9) {
						mouseOverExit = true
						if input.leftPress {
							Window.open = false	
						}
					}
					//	Dragging window
					else {
						if mouseOverExit mouseOverExit = false	
						//	The first click
						if input.leftPress and window_offsetX == -1 and window_offsetY == -1 {
							window_offsetX = abs(gui_mouse_x - windowX)
							window_offsetY = abs(gui_mouse_y - windowY)
						}
						//	Dragging
						else if input.leftPressed and window_offsetX != -1 and window_offsetY != -1 {
							Window.windowX = gui_mouse_x - window_offsetX
							Window.windowY = gui_mouse_y - window_offsetY
						}
						//	Releasing
						else if input.leftReleased {
							window_offsetX = -1 
							window_offsetY = -1
						}
					}
				}
				//	Mouse is in window
				else {
					//	Stretching window
					if point_in_rectangle(gui_mouse_x,gui_mouse_y, windowX+window_width-4,windowY,windowX+window_width+4,windowY+window_height-8) or (window_width_new != -1 and window_height_new == -1) {
						mouseOverCorner = false
						mouseOverHeight = false
						mouseOverWidth = true
						if input.leftPress {
							window_width_new = window_width	
						}
						else if input.leftPressed and window_width_new != -1 {
							var new_width = gui_mouse_x - windowX
							if new_width < Window.window_width_max and new_width > Window.window_width_min {
								Window.window_width = new_width
							}
						}
						else if input.leftReleased and window_width_new != -1 {
							window_width_new = -1	
						}
					}
					else if point_in_rectangle(gui_mouse_x,gui_mouse_y, windowX,windowY+window_height-4,windowX+window_width-8,windowY+window_height) or (window_width_new == -1 and window_height_new != -1) {
						mouseOverWidth = false
						mouseOverCorner = false
						mouseOverHeight = true
						if input.leftPress {
							window_height_new = window_height
						}
						else if input.leftPressed and window_height_new != -1 {
							var new_height = gui_mouse_y - windowY
							if new_height < Window.window_height_max and new_height > Window.window_height_min {
								Window.window_height = new_height
							}
						}
						else if input.leftReleased and window_height_new != -1 {
							window_height_new = -1	
						}
					}
					else if point_in_rectangle(gui_mouse_x,gui_mouse_y, windowX+window_width-8,windowY+window_height-8,windowX+window_width+4,windowY+window_height) or (window_width_new != -1 and window_height_new != -1) {
						mouseOverHeight = false
						mouseOverWidth = false
						mouseOverCorner = true
						if input.leftPress {
							window_width_new = window_width
							window_height_new = window_height
						}
						else if input.leftPressed and window_width_new != -1 and window_height_new != -1 {
							var new_width = gui_mouse_x - windowX
							var new_height = gui_mouse_y - windowY
							if new_width < Window.window_width_max and new_width > Window.window_width_min {
								Window.window_width = new_width	
							}
							if new_height < Window.window_height_max and new_height > Window.window_height_min {
								Window.window_height = new_height	
							}
						}
						else if input.leftReleased and window_width_new != -1 and window_height_new != -1 {
							window_width_new = -1
							window_height_new = -1
						}
					}
					else {
						mouseOverWidth = false
						mouseOverHeight = false
						mouseOverCorner = false	
					}
						
				}
			}
			else {
				if window_interaction == i and mouseOverExit mouseOverExit = false	
			}
			
			if window_interaction == i {
				//	Mouse
				if mouseOverWidth window_set_cursor(cr_size_we)
				else if mouseOverHeight window_set_cursor(cr_size_ns)
				else if mouseOverCorner window_set_cursor(cr_size_nwse)
				else {
					window_set_cursor(cr_arrow)
				}
			}
				
			//	Window shtuff
			//switch(i) {
			//	case 1:
					
			//	break
			//}
				
		}
	}
}
if temp_window_interaction == -1 and window_interaction > -1 {
	window_interaction = -1	
	mouseOverWindow = false
	mouseOverBar = false
	mouseOverExit = false
	mouseOverWidth = false
	mouseOverHeight = false
	mouseOverCorner = false
	window_set_cursor(cr_arrow)
}