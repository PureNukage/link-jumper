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

interacting = -1

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
	window_clickable = true
	window_scrollable = false
	window_scroll = 0
	window_scroll_max = 92
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
		//	Safari
		case 4:
			Window.window_width_max = 250
			Window.window_width = 250
			Window.window_height_max = 240
			Window.window_height = 240
			Window.window_width_min = 250
			Window.window_height_min = 240
		break
		//	Factorio
		case 5:
			Window.window_clickable = false
		break
		//	Half-Life 2
		case 6:
			Window.window_clickable = false
		break
		//	Task List
		case 8:
			Window.window_width_max = 420
			Window.window_height_max = 400
		break
		//	Photos
		case 9:
			Window.window_width_max = 400
			Window.window_scrollable = true
			Window.window_scroll_max = 120
		break
		//	Messenges
		case 10:
			Window.window_width_max = 500
			Window.window_height_max = 300
		break
		//	Phone
		case 11:
			Window.window_clickable = false
		break
		//	Charts
		case 12:
			Window.window_width_max = 250
			Window.window_width = 250
			Window.window_height_max = 240
			Window.window_height = 240
			Window.window_width_min = 250
			Window.window_height_min = 240
		break
		//	Music
		case 14:
			
		break
	}
	
}


#region Messenges

function _create_message(_text, _type) constructor {
	used = false
	responses = ds_list_create()
	read = false
	text = _text
	type = _type
	index = -1
}

messages = ds_list_create()
function create_message(_text, _type) {
	var Message = _create_message(_text, _type)
	ds_list_add(messages, Message)
	var Index = ds_list_size(messages)-1
	Message.index = Index
	return Message
}
var Message = create_message("morning Sergey", message_received)
Message.responses[| 0] = 1
Message.responses[| 1] = 2
Message.responses[| 2] = 3
create_message("Good evening Ari", message_sent)
create_message("Ari, I seem to be stuck in a loop", message_sent)

messenge = [[]]
messenge_index = -1
messenge_count = 0
for(var i=0;i<9;i++) {
	messenge[i, messenge_used] = false
	messenge[i, messenge_responses] = ds_list_create()
	messenge[i, messenge_read] = false
	var String = ""
	var Type = messenge_received
	var List = messenge[i, messenge_responses]
	switch(i) {
		case 0:
			String = "morning Sergey"
			messenge[i, messenge_used] = true
			messenge_index = 0
			List[| 0] = 1
			List[| 1] = 2
			List[| 2] = 3
		break
		case 1:
			String = "Good evening Ari"
			Type = messenge_sent
		break
		case 2:
			String = "Ari, I seem to be stuck in a loop"
			Type = messenge_sent
			List[| 0] = 4
		break
		case 3:
			String = "The clock in my living room has a countdown"
			Type = messenge_sent
			List[| 0] = 5
		break
		case 4:
			String = "Stuck in a loop huh. Don't worry, it can happen to anyone"
			Type = messenge_received
		break
		case 5:
			String = "Uh-oh. That's not good"
			Type = messenge_received
			List[| 0] = 6
		break
		case 6:
			String = "Unfortunately you're the only one that knows the combo to solve it"
			Type = messenge_received
			List[| 0] = 7
		break
		case 7:
			String = "Do you have any hints?"
			Type = messenge_sent
			List[| 0] = 8
		break
		case 8:
			String = "I'm going to guess that something you collect plays a part in the combination"
			Type = messenge_received
		break
	}
	messenge[i, messenge_string] = String
	messenge[i, messenge_type] = Type
}
	
function messenge_send(index) {
	messenge[index, messenge_used] = true
}

#endregion

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