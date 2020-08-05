if lossState > -1 {
	draw_sprite(s_pepe,0,x,y)
	draw_sprite(sprite_index,image_index,x,y)
	
	if lossState == 1 {
		draw_set_color(c_white)
		if lossLaugh == 0 draw_text_transformed(x+300,y-64,"ha ha", 1.5,1.5, 0)
		if lossLaugh == 1 draw_text_transformed(x+300,y-48,"ha ha", 1.5,1.5, 0)
		if lossLaugh == 2 draw_text_transformed(x+300,y-32,"ha ha", 1.5,1.5, 0)
	}
}

else {
	draw_self()	
}