jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W")) or mouse_check_button_pressed(mb_left)
jumpHold = keyboard_check(vk_space) or keyboard_check(ord("W")) or mouse_check_button(mb_left)

leftPress = mouse_check_button_pressed(mb_left)

controlPress = keyboard_check_pressed(vk_control)