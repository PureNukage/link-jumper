//	Draw HP
var _x = 640
for(var i=0;i<hp;i++) {
	draw_sprite(s_health,0,_x,32)
	_x += 48
}

draw_set_color(c_black)
draw_set_halign(fa_right)
draw_text(1280-15,15,"jump: "+string(jump))
draw_set_halign(fa_left)

