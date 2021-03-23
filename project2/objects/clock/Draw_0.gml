draw_self()

var Seconds = string(60 - time.seconds)
var Minutes = string(app.chapter3_timer)
if (60-time.seconds) < 10 {
	var Seconds = "0" + string(60 - time.seconds)	
}
if (60-time.seconds) == 60 {
	var Seconds = "00"	
	var Minutes = string(app.chapter3_timer + 1)
}

if app.gameOver {
	Minutes = "0"
	Seconds = "00"
}

var Time = Minutes + ":" + Seconds

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
var scale = 2
draw_text_transformed(x+abs(bbox_left-bbox_right)/2,y+abs(bbox_bottom-bbox_top)/2,Time, scale,scale,0)

draw_reset()