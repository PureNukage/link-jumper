jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or mouse_check_button_pressed(mb_left)
jumpHold = keyboard_check(vk_space) or keyboard_check(ord("W")) or mouse_check_button(mb_left)

leftPress = mouse_check_button_pressed(mb_left)

controlPress = keyboard_check_pressed(vk_control)

keyInteraction = keyboard_check_pressed(ord("E"))

keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D"))
keyDown = keyboard_check(ord("S"))
keyUp = keyboard_check(ord("W"))

doubleClick = false
doubleClickTime = -1