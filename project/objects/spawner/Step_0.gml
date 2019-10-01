spawn_time_current++

if spawn_time_current == spawn_time {
	var throw_height = irandom_range(y,y-96)
	var bounce_chance = irandom_range(1,100)
	var _obstacle = instance_create_layer(x,throw_height,"Instances",obstacle)
	if bounce_chance > 90 {
		_obstacle.bounce = 1
	}	
	spawn_time_current = 0 
	spawn_time = irandom_range(10,80)
}	

if keyboard_check_pressed(vk_left) {
	x = 925
} else if keyboard_check_pressed(vk_right) {
	x = 1248
}	