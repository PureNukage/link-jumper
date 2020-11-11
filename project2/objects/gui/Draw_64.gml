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
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(centerX,centerY-150, "Chainlink")
	
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