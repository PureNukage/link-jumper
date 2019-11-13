if game_start == false {
	//	Button background
	draw_set_color(button_color)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)
	
	//	Button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

	//	Button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(font_reg_12)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_string)
	
	//	Header text
	draw_text(headerX,headerY,header_string)
	
	//	Subheader text
	draw_text(headerX,headerY+128,subheader_string)
	
	
	
} else {
	draw_self()

}

