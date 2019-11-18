//	Draw HP
var _x = window_get_width()/2
for(var i=0;i<hp;i++) {
	draw_sprite(s_health,0,_x,32)
	_x += 48
}

//	Draw Running score
draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(font_reg_12)
draw_text(window_get_width()/2,80,"Score: "+string(running_score))

//draw_set_color(c_black)
//draw_set_halign(fa_right)
//draw_text(1280-15,15,"jump: "+string(jump))
//draw_set_halign(fa_left)

