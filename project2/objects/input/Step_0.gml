leftPress = mouse_check_button_pressed(mb_left)

if leftPress {
	if doubleClickTime == -1 doubleClickTime = time.stream
	else if (time.stream - doubleClickTime) < 15 {
		doubleClick = true
		doubleClickTime = -1
	}
}
else {
	doubleClick = false
	if (doubleClickTime > -1 and (time.stream - doubleClickTime) < 15) {
		doubleClickTime = -1	
	}
}

jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or (device_mouse_check_button(0,mb_left) and device_mouse_check_button(1,mb_left))
jumpHold = keyboard_check(vk_space) or keyboard_check(ord("W")) or device_mouse_check_button(0,mb_left) or device_mouse_check_button(1,mb_left)

controlPress = keyboard_check_pressed(vk_control)

keyInteraction = keyboard_check_pressed(ord("E"))

keyLeft = keyboard_check(ord("A")) or (mouse_check_button(mb_left) and mouse_x < display_get_gui_width()/2)
keyRight = keyboard_check(ord("D")) or (mouse_check_button(mb_left) and mouse_x > display_get_gui_width()/2)
keyDown = keyboard_check(ord("S"))
keyUp = keyboard_check(ord("W"))