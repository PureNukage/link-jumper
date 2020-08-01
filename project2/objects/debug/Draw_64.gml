if on {
	
	var xx = 15
	var yy = 15
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	
	with player {
		draw_text(xx,yy, "jump: "+string(jump))		yy += 15
		draw_text(xx,yy, "vspd: "+string(vspd))		yy += 15
	}	
	
	
	
	//	Buttons
	var width = 200
	var height = 100
	var xx = display_get_gui_width()/2 - width
	var yy = 30
	draw_set_color(c_gray)
	draw_roundrect(xx,yy,xx+width,yy+height,false) 
	
	
	var clicked = draw_debug_button(xx+15,yy+15,80,30,"Stage 1")
	if clicked {
		app.stage = 1
		if instance_exists(obstacle) with obstacle instance_destroy()
		var roadID = layer_get_id("Road")
		var lightpolesID = layer_get_id("Lightpoles")
		var cityID = layer_get_id("City")
		var skyID = layer_get_id("Sky")
		layer_hspeed(roadID,0)
		layer_hspeed(lightpolesID,0)
		layer_hspeed(cityID,0)
		layer_hspeed(skyID,0)
	}
		
	draw_reset()
	
}	