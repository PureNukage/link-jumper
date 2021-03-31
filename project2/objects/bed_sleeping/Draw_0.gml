draw_self()

var _x = x - 600
var _y = y + creditsY

creditsY -= 1

var space = 128

draw_set_color(c_white)
draw_text(_x, _y, "Created by Nukage")

_y += space

draw_text(_x, _y, "Music for Chapters 1 and 2 by Wombocombo")

_y += space

draw_text(_x, _y, "Music for Chapter 3 by Kei")

_y += space

draw_text(_x, _y, "Thanks to the Chainlink team for the inspiration")

_y += space

//draw_text(200, 200, string(creditsY))

if creditsY <= -1000 {
	game_restart()	
}