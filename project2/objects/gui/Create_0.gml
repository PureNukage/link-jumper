showRestart = false

showInteract = false

showArrows = false
showArrowsFlying = false
arrowTimer = 90

showMessage = false
messageTimer = 0
text = ""

showEnd = false

showMenu = true

function _create_window() constructor {
	open = false
	windowX = 192
	windowY = 128
	window_width = 256
	window_height = 192
	window_width_max = 312
	window_height_max = 256
	window_width_min = 128
	window_height_min = 96
	window_depth = -1
	window_string = ""
	window_index = -1
}

showPC = false
window_offsetX = -1
window_offsetY = -1
window_width_new = -1
window_height_new = -1
window_interaction = -1
window_depth_list = ds_list_create()
mouseOverWindow = false
mouseOverBar = false
mouseOverExit = false
mouseOverWidth = false
mouseOverHeight = false
mouseOverCorner = false
icon_array = [[]]
icon_array[0, icon_y] = 0
for(var i=1;i<20;i++) {
	icon_array[i, icon_y] = 0
	
	var String = ""
	switch(i) {
		case 1: String = "My Profile" break
		case 4: String = "Safari" break
		case 5: String = "Factorio" break
		case 6: String = "Half-Life 2" break
		case 7: String = "Calendar" break
		case 8: String = "Task List" break
		case 9: String = "Photos" break
		case 10: String = "Messages" break
		case 11: String = "Phone" break
		case 12: String = "Charts" break
		case 14: String = "Music" break
		case 16: String = "Settings" break
		case 17: String = "Downloads" break
		case 18: String = "Trash" break
	}
	icon_array[i, icon_string] = String
	
	icon_array[i, icon_window] = new _create_window()
	icon_array[i, icon_window].window_string = String
	icon_array[i, icon_window].window_index = i
	
	var Window = icon_array[i, icon_window]
	//	Other settings
	switch(i) {
		//	My profile
		case 1:
			Window.window_width_min = 246
			Window.window_height_min = 216
			Window.window_height = 216
		break
	}
	
}

function setMessage(String, timer) {
	
	text = String
	messageTimer = timer
	showMessage = true
	
}

function endMessage() {
	text = ""
	messageTimer = -1
	showMessage = false
}