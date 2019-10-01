spawn_time_current++

if spawn_time_current == spawn_time {
	var throw_height = irandom_range(y,y-96)
	var _obstacle = instance_create_layer(x,throw_height,"Instances",obstacle)
	spawn_time_current = 0 
	spawn_time = irandom_range(10,80)
}	