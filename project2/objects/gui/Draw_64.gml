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
			
			var Window = icon_array[i, icon_window]
			
			//	Mouseover code
			if point_in_rectangle(gui_mouse_x,gui_mouse_y, xx,yy,xx+32,yy+32) {

				var Y = icon_array[i, icon_y]
				
				icon_array[i, icon_y] = wave(-24, 6, 0.5, 0)
				yy += icon_array[i, icon_y]
				
				//	Open the app
				if input.leftPress and Window.window_clickable {
										
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
					
				}
				
				//	Draw the name of the app
				draw_set_color(c_white)
				draw_set_halign(fa_center)
				draw_text(xx+16,yy-32, Window.window_string)
				
			}
			else {
				yy = 64+416-48 + 4
				icon_array[i, icon_y] = 0
			}
			
			draw_sprite_ext(asset_get_index(spriteName),0, xx,yy, scale,scale, 0,c_white,1) 
			
			//	Unread messenges
			if i == 10 and message_count > 0 {
				draw_set_color(c_red)
				draw_circle(xx+32,yy+8,12,false)
				draw_set_color(c_white)
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_text(xx+32,yy+6,string(message_count))
			}
			
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
	for(var i=ds_list_size(window_depth_list)-1;i>-1;i--) {
		//	Determine the icons                  
		var Window = window_depth_list[| i]  	
		if Window.open {
				
			var windowX = Window.windowX
			var windowY = Window.windowY
			var window_width = Window.window_width
			var window_height = Window.window_height
			var border = 2
	
			//	Background
			draw_set_color(c_black)
			draw_roundrect(windowX, windowY, windowX+window_width, windowY+window_height, false)
			draw_set_color(c_ltgray)
			draw_roundrect(windowX+border, windowY+border, windowX+window_width-border, windowY+window_height-border, false)
				
			//	Top bar
			draw_set_color(c_dkgray)
			var height = 24
			draw_roundrect(windowX+border,windowY+border, windowX+window_width-border,windowY+height,false)
				
			//	Exit
			if mouseOverExit and window_interaction == i draw_set_color(c_ltgray)
			else draw_set_color(c_gray)
			draw_circle(windowX+window_width-19,windowY+12,9,false)
			draw_set_color(c_white)
			draw_set_halign(fa_middle)
			draw_set_valign(fa_top)
			var scale = 1
			draw_text_transformed(windowX+window_width-18,windowY+3,"X",scale,scale,0)
				
			//	Window shtuff
			var surface = surface_create(display_get_gui_width(), display_get_gui_height()+200)
			surface_set_target(surface)
			draw_clear_alpha(c_black, 0)
			
			switch(Window.window_index) {
				#region My Profile
					case 1:
						
						draw_set_color(c_black)
						draw_set_halign(fa_center)
						draw_text(windowX+window_width/2, windowY+36, Window.window_string)
						
						draw_set_halign(fa_left)
						draw_text(windowX+12, windowY+64, "Computer Name: ")
						
						draw_rectangle(windowX+150, windowY+64, windowX+236,windowY+85, true)
						draw_text(windowX+155, windowY+64, "FIN-9000")
						
						draw_text(windowX+12, windowY+100, "Network Sharing: OFF")
						
						//	Change Password
						draw_rectangle(windowX+window_width/2-75-2, windowY+132-2, windowX+window_width/2+75+2, windowY+162+2, false)
						draw_set_color(c_dkgray)
						draw_rectangle(windowX+window_width/2-75, windowY+132, windowX+window_width/2+75, windowY+162, false)
						draw_set_color(c_white)
						draw_set_halign(fa_center)
						draw_text(windowX+window_width/2, windowY+136, "Change Password")
						
						//	Change username
						draw_set_color(c_black)
						draw_rectangle(windowX+window_width/2-75-2, windowY+172-2, windowX+window_width/2+75+2, windowY+200+2, false)
						draw_set_color(c_dkgray)
						draw_rectangle(windowX+window_width/2-75, windowY+172, windowX+window_width/2+75, windowY+200, false)
						draw_set_color(c_white)
						draw_set_halign(fa_center)
						draw_text(windowX+window_width/2, windowY+176, "Change Username")
						
					break
				#endregion
				
				#region Safari
					case 4:
						
						var scale = 0.98
						draw_sprite_ext(s_amazon_wallpaper,0,windowX+3,windowY+height-24, scale,scale, 0,c_white,1)
						
					break
				#endregion
				
				#region Calendar
					case 7:
						
						draw_set_color(c_black)
						
						draw_text(windowX+window_width/2, windowY+32, "June")
						
						var date = 1
						for(var h=0;h<6;h++) {
							for(var w=0;w<7;w++) {
								var X = windowX+28 + w*32
								var Y = windowY+52 + h*32
								draw_rectangle(X,Y, X+30,Y+30, true)
								
								switch(date) {
									case 4:
										draw_set_color(c_green)
										draw_rectangle(X,Y,X+30,Y+30, false)
									break
									
								}
								
								draw_set_color(c_black)
								if date < 31 {
									draw_text(X+15,Y,string(date))
									date++
								}
							}
						}
						
					break
				#endregion
				
				#region Task List
					case 8:
						
						var X = windowX + 24 
						var Y = windowY + 48
						for(var t=0;t<5;t++) {
							draw_set_color(c_black)
							draw_rectangle(X,Y, X+24,Y+24,true)
							
							draw_set_halign(fa_left)
							switch(t) {
								case 0:
									draw_text(X+32,Y+2, "Find more Lucky brand shirts")
								break
								case 1:
									draw_text(X+32,Y+2, "Remake Smart Contract Builder")
								break
								case 2:
									draw_text(X+32,Y+2, "Cook up the steaks before they go bad")
								break
							}
							Y += 48
						}
						
					break
				#endregion
				
				#region Photos
					case 9:
						
						var X = windowX+24
						var Y = windowY+12
						var scale = 0.25
						draw_sprite_ext(s_meme_1,0,X,Y, scale,scale, 0,c_white,1)
						
						X += 140
						var scale = 0.25
						draw_sprite_ext(s_meme_2,0,X,Y, scale,scale, 0,c_white,1)
						
						X += 110
						var scale = 0.14
						draw_sprite_ext(s_meme_5,0,X,Y, scale,scale, 0,c_white,1)
						
						X = windowX+24
						Y += 185
						var scale = 0.5
						draw_sprite_ext(s_meme_3,0,X,Y, scale,scale, 0,c_white,1)
						
						X += 115
						var scale = 0.25
						draw_sprite_ext(s_meme_4,0,X,Y, scale,scale, 0,c_white,1)
						
					break
				#endregion
				
				#region Messages
					case 10:
						
						var X = windowX+window_width/2
						var Y = windowY
						draw_set_color(c_black)
						draw_text(X,Y, "Ari")
						
						var receivedX = windowX+12
						var receivedY = windowY+24-Window.window_scroll
						var sentX = windowX+window_width-128
						var sentY = windowY+60-Window.window_scroll
						draw_set_halign(fa_left)
						////	Draw messages
						var history = ds_list_size(message_history)
						for(var m=0;m<history;m++) {
							var Message = message_history[| m]
							var Type = Message.type
							var Text = Message.text
						
							var buffer = 6
							var sep = 200
							var width = string_width_ext(Text,string_height(Text),sep) + buffer*2
							var height = string_height_ext(Text,string_height(Text),sep) + buffer*2
							
							//	Received
							if Type == message_received {
								draw_set_color(c_gray)
								draw_roundrect(receivedX-buffer,receivedY, receivedX+width,receivedY+height, false)
								draw_set_color(c_black)
								draw_text_ext(receivedX,receivedY+2,Text,string_height(Text),sep)
							}
							//	Sent
							else {
								sentX = windowX+window_width-width-buffer
								draw_set_color(c_green)
								draw_roundrect(sentX-buffer,sentY, sentX+width,sentY+height, false)
								draw_set_color(c_white)
								draw_text_ext(sentX,sentY+2,Text,string_height(Text),sep)
								sentY += height + 8
							}
						}
						////	Draw Messages we can say
						for(var m=0;m<ds_list_size(messages_to_say);m++) {
							var Message = messages_to_say[| m]
							var Text = Message.text
							var X = windowX+window_width/2
							var Y = windowY+window_height-64-(64*m)
							var buffer = 6
							var sep = 200
							var Width = string_width_ext(Text,-1,sep)+buffer*2
							var Height = string_height_ext(Text,-1,sep)+buffer*2
							
							if point_in_rectangle(gui_mouse_x,gui_mouse_y, X-Width/2,Y+24,X+Width/2,Y+Height+24) {
								draw_set_color(c_gray)
								if input.leftPress {
									message_send(Message)
									ds_list_delete(messages_to_say, m)
								}
							}
							else {
								draw_set_color(c_black)
							}
							draw_roundrect(X-Width/2,Y,X+Width/2,Y+Height,false)
							draw_set_color(c_white)
							draw_set_halign(fa_center)
							draw_set_valign(fa_middle)
							draw_text_ext(X,Y+Height/2,Text,string_height(Text),sep)
						}						
						
					break
				#endregion
				
				#region Charts
					case 12:
						var scale = 0.98
						draw_sprite_ext(s_doge_chart,0,windowX+3,windowY+height-24, scale,scale, 0,c_white,1)
					break
				#endregion
				
				#region Music
					case 14:
					
						var X = windowX+12
						var Y = windowY+32
						
						//	Play Track 1 Button
						draw_set_color(c_black)
						draw_rectangle(X-2,Y-2, X+128+2,Y+32+2, false)
						if point_in_rectangle(gui_mouse_x,gui_mouse_y, X,Y+24, X+128,Y+32+24) {
							draw_set_color(c_gray)
							if input.leftPress {
								if !audio_is_playing(snd_music) {
									sound.playSoundEffect(snd_music)
									//	Check if other song is playing
									if audio_is_playing(snd_music_2) audio_stop_sound(snd_music_2)
								}
								else {
									audio_stop_sound(snd_music)	
								}
							}
						}
						else {
							draw_set_color(c_dkgray)
						}
						draw_rectangle(X,Y, X+128,Y+32, false)
						
						draw_set_color(c_white)
						draw_set_halign(fa_left)
						draw_text(X+8,Y+6, "Play Track 1")
						
						//	Track 1 Loop 
						draw_set_color(c_black)
						draw_rectangle(X+148-2, Y-2, X+192+2, Y+32+2, false)
						if point_in_rectangle(gui_mouse_x,gui_mouse_y, X+148, Y+24, X+192, Y+32+24) {
							draw_set_color(c_gray)
							if input.leftPress {
								sound.music_1_loop = !sound.music_1_loop
							}
						}
						else {
							if sound.music_1_loop draw_set_color(c_gray)
							else draw_set_color(c_dkgray)	
						}
						draw_rectangle(X+148, Y, X+192, Y+32, false)
						
						draw_set_color(c_white)
						draw_text(X+152, Y+6, "Loop")
						
						Y += 48
						
						//	Player Track 2 Button
						draw_set_color(c_black)
						draw_rectangle(X-2,Y-2, X+128+2,Y+32+2, false)
						if point_in_rectangle(gui_mouse_x,gui_mouse_y, X,Y+24, X+128,Y+32+24) {
							draw_set_color(c_gray)
							if input.leftPress {
								if !audio_is_playing(snd_music_2) {
									sound.playSoundEffect(snd_music_2)	
									//	Check if other song is playing
									if audio_is_playing(snd_music) audio_stop_sound(snd_music)
								}
								else {
									audio_stop_sound(snd_music_2)	
								}
							}
						}
						else {
							draw_set_color(c_dkgray)
						}
						draw_rectangle(X,Y, X+128,Y+32, false)
						
						draw_set_color(c_white)
						draw_text(X+8,Y+6, "Play Track 2")
						
						//	Track 2 Loop
						draw_set_color(c_black)
						draw_rectangle(X+148-2, Y-2, X+192+2, Y+32+2, false)
						if point_in_rectangle(gui_mouse_x,gui_mouse_y, X+148, Y+24, X+192, Y+32+24) {
							draw_set_color(c_gray)
							if input.leftPress {
								sound.music_2_loop = !sound.music_2_loop
							}
						}
						else {
							if sound.music_2_loop draw_set_color(c_gray)
							else draw_set_color(c_dkgray)	
						}
						draw_rectangle(X+148, Y, X+192, Y+32, false)
						
						draw_set_color(c_white)
						draw_text(X+152, Y+6, "Loop")
						
						//	Volume slider
						Y += 80
						
						draw_set_color(c_black)
						draw_text(X+72,Y-24,"Volume")
						draw_rectangle(X,Y,X+192,Y+24,false)
						
						var circleX = X + (192 * sound.music_volume)
						var circleY = Y+12
						if point_in_circle(gui_mouse_x,gui_mouse_y, circleX,circleY+24, 24) {
							draw_set_color(c_gray)
						}
						else {
							draw_set_color(c_dkgray)
						}
						if point_in_rectangle(gui_mouse_x,gui_mouse_y, X,Y+24,X+192,Y+24+24) {
							if input.leftPressed {
								var Volume = ((gui_mouse_x-204) / (X+192-204))
								debug.log(string(Volume))
								sound.music_volume = Volume
								if audio_is_playing(snd_music) audio_sound_gain(snd_music,Volume,0)
								else if audio_is_playing(snd_music_2) audio_sound_gain(snd_music_2,Volume,0)
							}
						}
						draw_circle(circleX,circleY,24,false)
						
						////	DEBUG
						//draw_set_halign(fa_left)
						//draw_text(windowX+window_width-64,windowY,string(gui_mouse_x))
						
					break
				#endregion
				
				#region Settings
					case 16:
					
						
						
					break
				#endregion
			}
			surface_reset_target()
			
			draw_surface_part(surface, windowX,windowY+Window.window_scroll,window_width,window_height-24, windowX,windowY+24)
			
			surface_free(surface)
				
			////	DEBUG WINDOWS
			//draw_set_color(c_red)
			//draw_set_alpha(0.5)
			//draw_rectangle(windowX+window_width-4,windowY,windowX+window_width+4,windowY+window_height-8,false)
			//draw_rectangle(windowX,windowY+window_height-4,windowX+window_width-8,windowY+window_height,false)
			//draw_rectangle(windowX+window_width-8,windowY+window_height-8,windowX+window_width+4,windowY+window_height,false)
				
			//draw_set_alpha(1)
			
			//draw_set_color(c_white)
			//draw_text(windowX+48,windowY+48,string(Window.window_depth))
				
		}
	}
	
	draw_reset()
	
}