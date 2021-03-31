//	End Game text
if stage == 0 {

}
//	Credits
else if stage == 3 {

	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_set_alpha(1)

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

	draw_text_ext(_x, _y, "Thanks to the Chainlink team for the work they do and for humoring this", string_height("1"),500)

	_y += space

	//draw_text(200, 200, string(creditsY))

	if creditsY <= -1000 {
		game_restart()	
	}
}