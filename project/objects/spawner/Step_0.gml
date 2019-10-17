if time.stream == ds_queue_head(spawn_time) {
	ds_queue_dequeue(spawn_time)
	var throw_height = irandom_range(y,y-96)
	var _obstacle = instance_create_layer(x,throw_height,"Instances",obstacle)
	_obstacle.sprite_index = obstacles[| ds_queue_dequeue(spawn)]
}

if keyboard_check_pressed(vk_left) {
	x = 925
} else if keyboard_check_pressed(vk_right) {
	x = 1248
}	