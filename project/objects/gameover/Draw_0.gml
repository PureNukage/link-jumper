//	Scoreboard background
draw_set_color(c_ltgray)
draw_roundrect(scoreboardX,scoreboardY,scoreboardX+scoreboard_width,scoreboardY+scoreboard_height,false)

//	Scoreboard outline
draw_set_color(c_black)
draw_roundrect(scoreboardX,scoreboardY,scoreboardX+scoreboard_width,scoreboardY+scoreboard_height,true)

//	Game over tet
draw_set_color(c_maroon)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(font_gameover)
draw_text(scoreboardX+(scoreboard_width/2),scoreboardY+32,"Game Over")

//	Score
draw_set_font(font_reg_24)
draw_set_color(c_black)
draw_text(scoreboardX+(scoreboard_width/2),scoreboardY+96,"Score")
draw_set_font(font_reg_12)
draw_text(scoreboardX+(scoreboard_width/2),scoreboardY+128,string(running_score))

//	Draw button background
draw_set_color(color_button)
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

//	Draw button outline
draw_set_color(c_black)
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

//	Draw button text
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(buttonX+(button_width/2),buttonY+(button_height/2),"Menu")