var oldMask = sergey.mask_index
sergey.mask_index = sergey.sprite_index
if place_meeting(x,y,sergey) {
	interaction = true
	if input.keyInteraction {
		camera.nodeControl = !camera.nodeControl
		gui.showNodeControls = !gui.showNodeControls
		if !camera.nodeControl sergey.canMove = true
	}
}
else if interaction interaction = false
sergey.mask_index = oldMask

var amountFinished = 0
if instance_exists(tank) with tank if !receiver {
	for(var i=0;i<ds_list_size(list);i++) {
		var ID = list[| i]
		if ID.object_index == tank and ID.receiver and ID.type == type {
			amountFinished++
		}
	}
}
if amountFinished == 3 {
	if !gameDone app.switch_room(RoomFinished)
	gameDone = true
	app.gameDone = true
	camera.nodeControl = false
	gui.showNodeControls = false
	app.chapter3_timer = 5
	if audio_is_playing(snd_trackB) audio_stop_sound(snd_trackB)
	if !audio_is_playing(snd_trackA) {
		var Sound = audio_play_sound(snd_trackA,0,false)
		audio_sound_set_track_position(Sound, 50)
	}
}