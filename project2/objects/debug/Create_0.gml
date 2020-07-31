on = false

function log(String) {
	
	var Stream = "["+string(time.stream)+"] "
	
	var Object = string_upper(object_get_name(other.object_index))
	
	var fullString = Stream + Object + " " + String
	
	show_debug_message(fullString)
	
}

function draw_debug_button(X, Y, width, height, String) {
	
	var buttonWidth = width
	var buttonHeight = height
	var xx = X
	var yy = Y
	var clicked = false
	draw_set_color(c_black)
	draw_roundrect(xx-2,yy-2,xx+buttonWidth+2,yy+buttonHeight+2,false)
	
	if point_in_rectangle(gui_mouse_x,gui_mouse_y,xx-2,yy-2,xx+buttonWidth+2,yy+buttonHeight+2) {
		draw_set_color(c_ltgray)
		if input.leftPress {
			clicked = true	
		}
	}
	else {
		draw_set_color(c_gray)
	}
	draw_roundrect(xx,yy,xx+buttonWidth,yy+buttonHeight,false)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(xx+buttonWidth/2,yy+buttonHeight/2,String)	
	
	return clicked
	
}