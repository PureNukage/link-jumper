if live_call() return live_result

//	Windows
var temp_window_interaction = -1
for(var i=0;i<ds_list_size(window_depth_list);i++) {
	//	Determine the icons
	var Window = window_depth_list[| i]
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
			
			//	Mouse wheel scrolling
			if Window.window_scrollable {
				if input.mouseWheelUp or input.mouseWheelDown {
					var Direction = input.mouseWheelDown - input.mouseWheelUp
					Window.window_scroll += Direction * 8
					Window.window_scroll = clamp(Window.window_scroll, 0, Window.window_scroll_max)
				}
			}
				
			if input.leftPress {
				//	If this window was already open
				if Window.window_depth > -1 {
					ds_list_delete(window_depth_list, Window.window_depth)
				}
				
				//	Opening this window
				ds_list_insert(window_depth_list, 0, Window)
				Window.open = true
					
				//	Adjusting the window_depth
				for(var d=0;d<ds_list_size(window_depth_list);d++) {
					var _Window = window_depth_list[| d]
					_Window.window_depth = d
				}
				window_interaction = 0
			}
				
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
					
					mouseOverCorner = false
					mouseOverHeight = false
					mouseOverWidth = false
					
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
					
					//	Clamping window inside of the PC screen
					Window.windowX = clamp(Window.windowX, 64, 64+831-window_width)
					Window.windowY = clamp(Window.windowY, 64, 64+416-window_height)
				}
			}
			//	Mouse is in window
			else {
				////	Stretching window
				//	Stretching width
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
				//	Stretching height
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
				//	Stretching corner
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
					window_offsetX = -1
					window_offsetY = -1
				}
						
			}
		}
		else {
			if window_interaction == i {
				if mouseOverExit mouseOverExit = false	
			}
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
	
	
//	Messenge unread counting
var temp_messenge_count = 0
for(var m=0;m<array_length(messenge);m++) {
	var Used = messenge[m, messenge_used]
	var Read = messenge[m, messenge_read]
	if Used and !Read {
		temp_messenge_count++
	}
}
if temp_messenge_count > 0 and temp_messenge_count != messenge_count {
	messenge_count = temp_messenge_count		
}


//	Interactable objects
if position_meeting(mouse_x,mouse_y, class_interactable) {
	interacting = instance_position(mouse_x,mouse_y, class_interactable)
	if interacting.interactable window_set_cursor(cr_handpoint)
}
else if interacting > -1 {
	interacting = -1
	window_set_cursor(cr_arrow)
}