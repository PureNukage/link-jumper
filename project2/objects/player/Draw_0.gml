if damaged {
	shader_set(sdr_white)
	draw_self()
	shader_reset()
} else {
	draw_self()	
}

if app.stage == 3 {
	draw_sprite_ext(s_burningup,image_index,x,y+50,1,1,180,fallingColor,fallingAlpha)	
}