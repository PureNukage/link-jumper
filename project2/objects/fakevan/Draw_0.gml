if !blownUp {
	if !explode {
		if visible {
	
			if player.fallingStage == 4 {
				draw_set_color(c_dkgray)
				draw_ellipse(fakevan.x+256-player.fallRadius,fakevan.y+240-32, fakevan.x+256+player.fallRadius,fakevan.y+240+32, false)
			}
	
			draw_sprite(s_pepe,0,x,y)
			draw_sprite(sprite_index,image_index,x,y)

		}
	}

	else {
		draw_sprite(s_explosion,image_index, x+256,y+128)
		if (image_index > image_number-1) {
			blownUp = true
			explode = false
		}
	}
}

else {
	//draw_sprite(s_van,0, x,y)	
}