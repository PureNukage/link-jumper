if instance_exists(player) and app.stage == 2 {
	x = player.x
	y = player.y
}

if centerWindow = true {
	window_center()
	centerWindow = false
}

if os_browser != browser_not_a_browser {
	if (browser_width != window_get_width() or browser_width != window_get_height()) {
		scale_canvas(browser_width, browser_height, true)	
	}
}

//debug.log("window_width: "+string(window_get_width()))
//debug.log("window_height: "+string(window_get_height()))
//debug.log("display_width: "+string(display_get_width()))
//debug.log("display_height: "+string(display_get_height()))