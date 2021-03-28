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

showBookshelf = false

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
			Window.window_scrollable = true
			Window.window_scroll_max = 120
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


#region Messages

function _create_message(_text, _type) constructor {
	used = false
	usable = false
	response = -1
	read = false
	text = _text
	type = _type
	index = -1
}

messages = ds_list_create()
message_history = ds_list_create()
messages_to_say = ds_list_create()
message_count = 0
messagesY = 0
function create_message(_text, _type, _response) {
	var Message = new _create_message(_text, _type)
	ds_list_add(messages, Message)
	var Index = ds_list_size(messages)-1
	Message.index = Index
	Message.response = _response
	return Message
}
function message_send(_message) {
	_message.used = true
	ds_list_add(message_history, _message)
	//	Prep the response
	if _message.response > -1 {
		message_send(messages[| _message.response])
	}
}
var Message = create_message("morning Sergey", message_received, -1)															//	0
message_send(Message)																							
create_message("Good evening Ari", message_sent, -1)																			//	1
create_message("Ari, I seem to be stuck in a loop", message_sent, 4)															//	2
create_message("The clock in my living room has a countdown", message_sent, 5)													//	3
create_message("Stuck in a loop huh. Don't worry, it can happen to anyone", message_received, -1)								//	4
create_message("Uh-oh. That's not good", message_received, -1)																	//	5
create_message("Unfortunately you're the only one that knows the combo to solve it", message_received, -1)						//	6
create_message("Do you have any hints?", message_sent, 8)																		//	7
create_message("I'm going to guess that something you collect plays a part in the combination", message_received, -1)			//	8

function message_check() {
	for(var i=0;i<ds_list_size(messages);i++) {
		var Message = messages[| i]
		var Usable = Message.usable
		
		var canUse = false
		switch(i) {
			//	good evening Ari
			case 1:
				if messages[| 0].used canUse = true		
			break
			//	Ari, I seem to be stuck in a loop
			case 2:
				if app.chapter3_looped_once canUse = true
			break
			//	The clock in my living room has a countdown
			case 3:
				if app.chapter3_seen_timer canUse = true
			break
			//	Do you have any hints?
			case 4:
				if messages[| 6].used canUse = true
			break
			//	Do you have any hints?
			case 7:
				if messages[| 5].used canUse = true
			break
		}
		
		if !Usable and canUse {
			debug.log("Can say: "+string_upper(Message.text))
			Message.usable = true
			ds_list_insert(messages_to_say, 0, Message)
		}
		
	}
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