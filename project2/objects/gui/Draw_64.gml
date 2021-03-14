if live_call() return live_result

if showRestart {
	
	var width = 128
	var height = 64
	var xx = display_get_gui_width()/2 - width/2
	var yy = display_get_gui_height()/2 - height/2
	draw_set_color(c_black)
	draw_roundrect(xx-2,yy-2,xx+width+2,yy+height+2,false)
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx,yy,xx+width,yy+height) {
		draw_set_color(c_ltgray)
		if input.leftPress {
			game_restart()
		}
	}
	else {
		draw_set_color(c_gray)
	}
	draw_roundrect(xx,yy,xx+width,yy+height,false)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(xx+width/2,yy+height/2,"Restart")
	
	draw_reset()
	
}
	
if showInteract {
	
	var xx = display_get_gui_width()/2
	var yy = display_get_gui_height()/2
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_outlined(xx,yy, "Press [E] to interact",c_white,c_black)
	draw_reset()
	
	if input.keyInteraction {
		
	}
	
	
}
	
if showArrows {
	
	arrowTimer--
	if arrowTimer <= 0 showArrows = false
	
	var centerX = display_get_gui_width()/2
	var centerY = display_get_gui_height()/2
	
	draw_sprite_ext(s_arrow,0, centerX,centerY-120,.5,.5, 90, c_white, 1)
	
	//draw_sprite_ext(s_arrow,0, centerX-120,centerY, .5,.5, 180, c_white, 1)
	
	//draw_sprite_ext(s_arrow,0, centerX+120,centerY, .5,.5, 0, c_white, 1)
	
	
}

if showArrowsFlying {
	arrowTimer--
	if arrowTimer <= 0 showArrowsFlying = false
	
	var centerX = display_get_gui_width()/2
	var centerY = display_get_gui_height()/2
	
	draw_sprite_ext(s_arrow,0, centerX+90,centerY-134,.5,.5, 0, c_white, 1)
	draw_sprite_ext(s_arrow,0, centerX-90,centerY-120,.5,.5, 180, c_white, 1)
	draw_sprite_ext(s_arrow,0, centerX,centerY-30,.5,.5, 270, c_white, 1)
}
	
if showMessage {
	
	messageTimer--
	
	draw_set_font(font_text)
	
	var centerX = display_get_gui_width()/2
	var centerY = display_get_gui_height()/2
	
	var width = string_width(text) + 40
	var height = string_height(text) + 20
	var xx = centerX - width/2
	var yy = centerY - height/2
	
	draw_set_color(c_black)
	draw_roundrect(xx-2,yy-2, xx+width+2,yy+height+2, false)
	
	draw_set_color(c_gray)
	draw_roundrect(xx,yy, xx+width,yy+height, false)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(xx+width/2,yy+height/2,text)
	
	draw_set_font(-1)
	
	if messageTimer <= 0 {
		endMessage()	
	}
		
}
	
if showEnd {
	
	var centerX = display_get_gui_width()/2
	var centerY = display_get_gui_height()/2
	
	var width = 300
	var height = 150
	var X = centerX - width/2
	var Y = centerY-height/2
	
	if debug.draw_debug_button(X,Y,width,height, "Journey complete. Press to exit") {
		game_restart()	
	}
	
}
	
if showMenu {
	
	
	//	Credits
	var xx = 30
	var yy = room_height - 60
	
	draw_set_color(c_white)
	draw_text(xx,yy, app.creator)
	draw_text(xx,yy+15, "Music by wombocombo")
	draw_text(xx,yy+30, "Help by @Leo_the_Potato")
	
	//	 version
	var xx = display_get_gui_width() - 100
	var yy = room_height - 30
	draw_text(xx,yy, "v"+string(app.version))
	
	var centerX = display_get_gui_width()/2
	var centerY = display_get_gui_height()/2
	
	draw_sprite(s_chainlinklogo, 0, centerX,centerY-150)
	var Scale = .3
	draw_sprite_ext(s_thejourney, 0, centerX,centerY-50, Scale,Scale, 0,c_white,1)
	
	draw_set_color(c_sergey_blue)
	draw_set_font(font_text)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(centerX,centerY-150, "Chainlink")
	draw_set_font(-1)
	
	var width = 120
	var height = 60
	var xx = centerX - width/2
	var yy = centerY + 80
	
	draw_set_color(c_black)
	draw_roundrect(xx-2,yy-2, xx+width+2,yy+height+2, false)
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y, xx,yy,xx+width,yy+height) {
		draw_set_color(c_sergey_blue2)
		if input.leftPress {
			app.switch_stage(0)	
		}
	}
	else {
		draw_set_color(c_sergey_blue)
	}
	draw_roundrect(xx,yy, xx+width,yy+height, false)
	
	draw_set_color(c_white)
	draw_text(xx+width/2,yy+height/2, "Play")
	
	if app.unlockedFlyingStage {
		var width = 180
		var height = 60
		var xx = centerX - width/2
		var yy = yy + 80
	
		draw_set_color(c_black)
		draw_roundrect(xx-2,yy-2, xx+width+2,yy+height+2, false)
	
		if point_in_rectangle(gui_mouse_x,gui_mouse_y, xx,yy,xx+width,yy+height) {
			draw_set_color(c_sergey_blue2)
			if input.leftPress {
				app.switch_stage(1)
			}
		}
		else {
			draw_set_color(c_sergey_blue)
		}
		draw_roundrect(xx,yy, xx+width,yy+height, false)
	
		draw_set_color(c_white)
		draw_text(xx+width/2,yy+height/2, "Start at Stage 2")	
	}
	
	draw_reset()
	
}
	
if showPC { 
	
	//	Background
	draw_set_color(c_gray)
	draw_rectangle(64,64, 64+831,64+416, false)
	
	//	Top bar
	draw_set_color(c_dkgray)
	//draw_sprite(s_topbar,0, 0,0)
	draw_rectangle(64,64, 64+832,64+32, false)
	
	draw_set_color(c_white)
	var xx = 128
	var yy = 68
	draw_text(xx,yy, "File") xx += 48
	draw_text(xx,yy, "Edit") xx += 48
	draw_text(xx,yy, "View") xx += 48
	draw_text(xx,yy, "Go") xx += 32
	draw_text(xx,yy, "Window") xx += 64
	draw_text(xx,yy, "Help") xx += 256
	
	yy += 3
	
	draw_sprite_ext(s_wifi_icon,0,xx,yy, 2.5,2.5,0,c_white,1) xx += 48
	draw_sprite_ext(s_computer_icon,0, xx,yy, 2.5,2.5,0,c_white,1) xx += 48
	draw_sprite_ext(s_battery_icon,0, xx,yy, 2.5,2.5,0,c_white,1) xx += 48
	
	yy -= 3
	
	draw_text(xx,yy,"Mon 06:50")
	
	//	Bottom bar
	var startX = 128
	draw_set_color(c_dkgray)
	draw_rectangle(startX,64+416-48, 928-startX, 64+416,false)
	
	xx = startX + 10
	yy = 64+416-48 + 4
	var scale = 1.5
	
	//	Icons
	for(var i=1;i<20;i++) {
		
		//	Drawing the icons
		var spriteName = "s_icon" + string(i)
		if sprite_exists(asset_get_index(spriteName)) {
			
			//	Mouseover code
			if point_in_rectangle(gui_mouse_x,gui_mouse_y, xx,yy,xx+32,yy+32) {

				var Y = icon_array[i, icon_y]
				
				icon_array[i, icon_y] = wave(-24, 6, 0.5, 0)
				yy += icon_array[i, icon_y]
				
				//	Open the app
				if input.leftPress {
					if !icon_array[i, icon_window].open icon_array[i, icon_window].open = true
				}
				
				//	Draw the name of the app
				draw_set_color(c_white)
				draw_set_halign(fa_center)
				draw_text(xx+16,yy-32, icon_array[i, icon_string])
			}
			else {
				yy = 64+416-48 + 4
				icon_array[i, icon_y] = 0
			}
			
			draw_sprite_ext(asset_get_index(spriteName),0, xx,yy, scale,scale, 0,c_white,1) 
			
			////	DEBUG
			//draw_set_color(c_white)
			//draw_text(xx+8,yy-48,string(i))
			//draw_set_color(c_red)
			//draw_set_alpha(0.5)
			//draw_rectangle(xx,yy, xx+32,yy+32, false)
			
			xx += 48	
		}
		
	}
		
	//	Windows
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
	
	draw_reset()
	
}