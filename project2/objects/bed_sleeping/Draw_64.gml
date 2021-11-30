var String = "The Network has been decentralized"

if stage == 0 {
	draw_set_halign(fa_middle)
	draw_set_alpha(timer / timerMax)
	draw_set_color(c_white)
	var _x = display_get_gui_width()/2
	var _y = display_get_gui_height()/2
	draw_text(_x,_y, String)
	timer++
	if timer >= timerMax {
		stage = 1
		timer = 0
	}
}
else if stage == 1 {
	timer++
	if timer >= timerMax {
		stage = 2	
	}
	draw_set_halign(fa_middle)
	draw_set_color(c_white)
	draw_set_alpha(1)
	var _x = display_get_gui_width()/2
	var _y = display_get_gui_height()/2
	draw_text(_x,_y, String)
}
else if stage == 2 {
	timer--
	if timer <= 0 {
		stage = 3	
	}
	draw_set_halign(fa_middle)
	draw_set_color(c_white)
	draw_set_alpha(timer / timerMax)
	var _x = display_get_gui_width()/2
	var _y = display_get_gui_height()/2
	draw_text(_x,_y, String)	
}