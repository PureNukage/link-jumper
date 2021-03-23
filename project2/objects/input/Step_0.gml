leftPress = mouse_check_button_pressed(mb_left)
leftPressed = mouse_check_button(mb_left)
leftReleased = mouse_check_button_released(mb_left)

mouseWheelUp = mouse_wheel_up()
mouseWheelDown = mouse_wheel_down()

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

jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or (device_mouse_check_button(0,mb_left) )//and device_mouse_check_button(1,mb_left))
jumpHold = keyboard_check(vk_space) or keyboard_check(ord("W")) or device_mouse_check_button(0,mb_left) //or device_mouse_check_button(1,mb_left)

controlPress = keyboard_check_pressed(vk_control)

keyInteraction = keyboard_check_pressed(ord("E"))

keySpeedTime = keyboard_check(vk_right)
keySpeedMinute = keyboard_check_pressed(vk_up)

var fingerScreenBuffer = 150
keyLeft = keyboard_check(ord("A")) or (mouse_check_button(mb_left) and (gui_mouse_x < display_get_gui_width()/2 - fingerScreenBuffer) and app.stage < 4)
keyRight = keyboard_check(ord("D")) or (mouse_check_button(mb_left) and (gui_mouse_x > display_get_gui_width()/2 + fingerScreenBuffer) and app.stage < 4)
keyDown = keyboard_check(ord("S")) or (mouse_check_button(mb_left) and (gui_mouse_y > display_get_gui_height()/2 + fingerScreenBuffer) and app.stage < 4)
if app.stage == 0 {
	keyUp = keyboard_check(ord("W")) or (mouse_check_button(mb_left) )//and gui_mouse_y < display_get_gui_height()/2 - fingerScreenBuffer)	
}
else keyUp = keyboard_check(ord("W")) or (mouse_check_button(mb_left) and (gui_mouse_y < display_get_gui_height()/2 - fingerScreenBuffer) and app.stage < 4)