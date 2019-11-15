button_width = 128
button_height = 64

buttonX = display_get_gui_width()/2-(button_width/2)
buttonY = display_get_gui_height()/2 - 32

button_string = "Play"

button_mouseover = false

color_logo = make_color_rgb(42,90,218)
color_button_normal = make_color_rgb(42,90,218)
color_button_highlight = make_color_rgb(29,63,153)

button_color = color_button_normal

help_buttonX = buttonX
help_buttonY = buttonY+button_height+32
help_button_color = color_button_normal
help_button_string = "How to Play"
help_menu_open = false

help_menu_width = 320
help_menu_height = 192
help_menuX = help_buttonX-help_menu_width/4
help_menuY = help_buttonY+button_height+16

image_speed = .75

volume = .25
volume_old = volume

volume_icon_x = display_get_gui_width()-96
volume_icon_y = 32



player_game_xpos = 256
player_game_ypos = 608

player_xpos = room_width+100
player_ypos = player_game_ypos


game_start = false

