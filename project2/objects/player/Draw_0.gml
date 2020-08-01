if damaged {
	shader_set(sdr_white)
	draw_self()
	shader_reset()
} else {
	draw_self()	
}