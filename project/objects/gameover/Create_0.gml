running_score = 0

scoreboard_width = 384
scoreboard_height = 320

scoreboardX = display_get_gui_width()/2-(scoreboard_width/2)
scoreboardY = display_get_gui_height()/3

button_width = 128
button_height = 64

buttonX = display_get_gui_width()/2-(button_width/2)
buttonY = scoreboardY+scoreboard_height-72

color_button_normal = make_color_rgb(42,90,218)
color_button_highlight = make_color_rgb(29,63,153)
color_button = color_button_normal