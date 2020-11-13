if instance_exists(spawner) and instance_exists(player) and app.stage == 0 {
	//stream += 1 * player.image_speed	
	//frames += 1 * player.image_speed
} else {
	//frames = floor(frames + 1)
	//stream = floor(stream + 1)
}

stream++
frames++

if frames >= 60 {
	seconds++
	frames = 0
	seconds_switch = 1
	seconds_stream++
} else {
	seconds_switch = 0	
}

if seconds >= 60 {
	minutes++
	seconds = 0
	minutes_switch = 1
	minutes_stream++
} else {
	minutes_switch = 0	
}