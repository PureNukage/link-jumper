if game_start == false {
	//	Network logo
	draw_sprite(s_chainlinknetwork,0,544,32)
	
	//	The Journey
	draw_sprite_ext(s_thejourney,0,502,179,0.222061,0.1902516,0,c_white,1)
	
	//	Chainlink text
	draw_set_font(font_reg_24)
	draw_set_color(color_logo)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(596,130,"Chainlink")
	
	//	Button background
	draw_set_color(button_color)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)
	
	//	Button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

	//	Button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(font_bold_12)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_string)
	
	//	Header text
	//draw_text(headerX,headerY,header_string)
	
	//	Subheader text
	//draw_text(headerX,headerY+128,subheader_string)
	
	
	
} else {
	draw_self()

}

//	Volume icon
if instance_number(music) == 0 {
	if volume == 0 {
		var _sprite = s_audio_off	
	} else { 
		var _sprite = s_audio_on
	}
	draw_sprite(_sprite,0,volume_icon_x,volume_icon_y)
}

