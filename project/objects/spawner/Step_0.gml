spawn_time_current++

if spawn_time_current == spawn_time {
	var _obstacle = instance_create_layer(x,y,"Instances",obstacle)
	spawn_time_current = 0 
	spawn_time = irandom_range(10,80)
}	