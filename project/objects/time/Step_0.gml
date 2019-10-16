frame++
stream++
if second_turn == 1 second_turn = 0
if minute_turn == 1 minute_turn = 0

if frame >= 60 {
	frame = 0
	second_turn = 1
	second++
}

if second >= 60 {
	second = 0	
	minute_turn = 1
	minute++
}