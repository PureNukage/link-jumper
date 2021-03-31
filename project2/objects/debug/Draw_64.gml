if on {
	
	var xx = 15
	var yy = 15
	
	draw_set_color(c_dkgray)
	draw_rectangle(xx-20,yy-20, xx+200,yy+200, false)
	
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	
	with player {
		draw_text(xx,yy, "jump: "+string(jump))		yy += 15
		draw_text(xx,yy, "vspd: "+string(vspd))		yy += 15
		draw_text(xx,yy, "image_angle: "+string(image_angle)) yy += 15
	}	
	
	with gui {
		draw_text(xx,yy, "window_offsetX: "+string(window_offsetX)) yy += 15
		draw_text(xx,yy, "window_offsetY: "+string(window_offsetY)) yy += 15
		draw_text(xx,yy, "window_width_new: "+string(window_width_new)) yy += 15
		draw_text(xx,yy, "window_height_new: "+string(window_height_new)) yy += 15
		draw_text(xx,yy, "window_interaction: "+string(window_interaction)) yy += 15
		draw_text(xx,yy, "interacting: "+string(interacting)) yy += 15
		draw_text(xx,yy, "books_selected: "+string(books_selected)) yy += 15
	}
	
	//	Time
	var Seconds = string(60 - time.seconds)
	var Minutes = string(app.chapter3_timer)
	if (60-time.seconds) < 10 {
		var Seconds = "0" + string(60 - time.seconds)	
	}
	if (60-time.seconds) == 60 {
		var Seconds = "00"	
		var Minutes = string(app.chapter3_timer + 1)
	}

	if app.gameOver {
		Minutes = "0"
		Seconds = "00"
	}

	var Time = Minutes + ":" + Seconds
	draw_text(xx,yy,"Time: "+Time)
	
	//	Buttons
	var width = 200
	var height = 140
	var xx = display_get_gui_width()/2 - width
	var yy = 30
	draw_set_color(c_gray)
	draw_roundrect(xx,yy,xx+width,yy+height,false) 
	
	
	var clicked = draw_debug_button(xx+15,yy+15,80,30,"Stage 1")
	if clicked {
		app.switch_stage(1)
	}

	var xx = xx + 90 + 15	
	var clicked = draw_debug_button(xx,yy+15,80,30,"Stage 2")
	if clicked {
		app.switch_stage(2)	
	}
	
	var xx = display_get_gui_width()/2 - width
	var yy = 30 + 80
	var clicked = draw_debug_button(xx+15,yy+15,80,30,"Stage 3")
	if clicked {
		app.switch_stage(2)	
		app.switch_stage(3)	
	}
		
	draw_reset()
	
}	