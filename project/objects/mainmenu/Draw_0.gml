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
	
	//	Play Button background
	draw_set_color(button_color)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)
	
	//	Play Button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

	//	Play Button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(font_bold_12)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_string)
	
	//	Help Button background
	draw_set_color(help_button_color)
	draw_roundrect(help_buttonX,help_buttonY,help_buttonX+button_width,help_buttonY+button_height,false)
	
	//	Help Button outline
	draw_set_color(c_black)
	draw_roundrect(help_buttonX,help_buttonY,help_buttonX+button_width,help_buttonY+button_height,true)
	
	//	Help Button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(font_bold_12)
	draw_text(help_buttonX+button_width/2,help_buttonY+button_height/2,help_button_string)
	
	//	Credits
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(15,15,"created by @PureNukage")
	draw_text(15,32,"assistance by @Leo_the_Potato")
	draw_text(15,49,"music by wombocombo")
	
	if help_menu_open == true { 
	//	Help menu background
	draw_set_color(c_ltgray)
	draw_roundrect(help_menuX,help_menuY,help_menuX+help_menu_width,help_menuY+help_menu_height,false)
	
	//	Help menu outline
	draw_set_color(c_black)
	draw_roundrect(help_menuX,help_menuY,help_menuX+help_menu_width,help_menuY+help_menu_height,true)
	
	//	Help images
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(help_menuX+16,help_menuY+24,"Press W/Space to jump \nHold to go higher")
	draw_sprite_ext(s_sergey_jump0,-1,help_menuX+225,help_menuY+48,.5,.5,0,c_white,1)
	draw_text(help_menuX+16,help_menuY+96,"Collect Chainlinks for health")
	draw_sprite_ext(s_chainlink,-1,help_menuX+240,help_menuY+76,.75,.75,0,c_white,1)
	draw_text(help_menuX+16,help_menuY+152,"Avoid everything else")
	draw_sprite(s_fud,-1,help_menuX+200,help_menuY+130)
	
	}
	
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

