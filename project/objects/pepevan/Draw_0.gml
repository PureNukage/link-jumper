//	Draw pepe
draw_sprite(s_pepe,-1,x,y)

//	Draw van
draw_sprite(s_van,-1,x,y)

if states == 1 {
	
	draw_set_font(font_gameover)
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	switch(laugh)
	{
		case 0:
			draw_text(x+486,y-240,"ha ha")
		break
		case 1:
			draw_text(x+492,y-240,"ha ha")
		break
		case 2:
			draw_text(x+500,y-240,"ha ha")
		break
	}
	
}