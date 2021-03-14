//	Windows
window_interaction = -1
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
				
			var mouseOverWindow = false
			var mouseOverBar = false
			var mouseOverExit = false
			var mouseOverWidth = false
			var mouseOverHeight = false
			var mouseOverCorner = false
	
			//	Background
			draw_set_color(c_black)
			draw_roundrect(windowX, windowY, windowX+window_width, windowY+window_height, false)
			draw_set_color(c_ltgray)
			draw_roundrect(windowX+border, windowY+border, windowX+window_width-border, windowY+window_height-border, false)
				
			draw_set_color(c_black)
			draw_text(windowX+window_width/2, windowY+window_height/2, icon_array[i, icon_string])
				
			//	Top bar
			draw_set_color(c_dkgray)
			var height = 24
			draw_roundrect(windowX+border,windowY+border, windowX+window_width-border,windowY+height,false)
				
			//	Window interaction
			if (point_in_rectangle(gui_mouse_x,gui_mouse_y, windowX,windowY,windowX+window_width,windowY+window_height) or window_offsetX != -1 or (window_width_new != -1 or window_height_new != -1)) and !window_interaction {
				window_interaction = true
				debug.log(string(i) + " window interaction!")
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
						
				}
			}
				
			//	Mouse
			if mouseOverWidth window_set_cursor(cr_size_we)
			else if mouseOverHeight window_set_cursor(cr_size_ns)
			else if mouseOverCorner window_set_cursor(cr_size_nwse)
			else window_set_cursor(cr_arrow)
				
			//	Exit
			if mouseOverExit draw_set_color(c_ltgray)
			else draw_set_color(c_gray)
			draw_circle(windowX+window_width-19,windowY+12,9,false)
			draw_set_color(c_white)
			draw_set_halign(fa_middle)
			draw_set_valign(fa_top)
			var scale = 1
			draw_text_transformed(windowX+window_width-18,windowY+3,"X",scale,scale,0)
				
			//	Window shtuff
			switch(i) {
				case 1:
					
				break
			}
				
			////	DEBUG WINDOWS
			draw_set_color(c_red)
			draw_set_alpha(0.5)
			draw_rectangle(windowX+window_width-4,windowY,windowX+window_width+4,windowY+window_height-8,false)
			draw_rectangle(windowX,windowY+window_height-4,windowX+window_width-8,windowY+window_height,false)
			draw_rectangle(windowX+window_width-8,windowY+window_height-8,windowX+window_width+4,windowY+window_height,false)
				
			draw_set_alpha(1)
				
		}
	}
}