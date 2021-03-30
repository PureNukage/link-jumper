var surface = surface_create(room_width, room_height)
surface_set_target(surface)
draw_clear_alpha(c_black, 0)

draw_self()

if filled {
	if image_index < image_number-1 draw_sprite_ext(sergey.sprite_index,sergey.image_index,sergey.x,sergey.y,sergey.image_xscale,1,0,c_white,1)
	if closing {
		draw_sprite(s_elevator_close_empty,image_index,x,y)	
	}
}

gpu_set_blendmode(bm_subtract)
draw_set_color(c_black)
draw_rectangle(0,245, room_width,room_height,false)
gpu_set_blendmode(bm_normal)

surface_reset_target()

draw_surface(surface,0,0)
surface_free(surface)

// 429, 245

if interaction and y == 92 {
	var scale = 3
	draw_sprite_ext(s_keyboard_e,0,x+50,y-32, scale,scale, 0,c_white,1)
}