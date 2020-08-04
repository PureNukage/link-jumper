if damaged {
	shader_set(sdr_white)
	draw_self()
	shader_reset()
} else {
	draw_self()	
}

if app.stage == 3 and !atStation and visible and !done {
	draw_sprite_ext(s_burningup,image_index,x,y+50,1,1,180,fallingColor,fallingAlpha)	
}

//if fallingStage == 4 {
	
//	draw_set_color(c_dkgray)
//	draw_circle(960/2, 540/2, fallRadius, false)
//	draw_circle(fakevan.x+256,fakevan.y+256, fallRadius, false)
	
//}