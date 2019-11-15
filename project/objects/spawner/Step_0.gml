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

//	Time to stage!
if (queue_time - time.stream) <= 120 {
	
	if (queue_solos > queue_dubs) and (queue_dubs >= queue_trips) {
		queue_solos--
		queue_dubs++
	} else if (queue_solos == queue_dubs) and (queue_dubs > queue_trips) {
		queue_dubs--
		queue_trips++
	} else if (queue_solos == 0 and queue_dubs > queue_trips) {
		queue_dubs--
		queue_trips++
	}
	
	var _obstacle_type
	if ds_list_size(available_stages) == 1 {
		_obstacle_type = available_stages[| 0]
		ds_list_clear(available_stages)
	} else {
		var _random = irandom_range(0,ds_list_size(available_stages)-1)
		_obstacle_type = available_stages[| _random]
		ds_list_delete(available_stages,_random)
	}
	
	stage(_obstacle_type,queue_solos,queue_dubs,queue_trips,queue_gap0,queue_gap1)
	
	queue_gap0 -= 5
	queue_gap1 -= 5
	
	if ds_list_size(available_stages) == 0 {
		available_stages[| 0] = obstacle_type.fud
		available_stages[| 1] = obstacle_type.duck
		available_stages[| 2] = obstacle_type.shadowfork
		ds_list_add(available_stages,obstacle_type.fist)
	}
	if queue_solos == 0 {
		ds_list_add(available_stages,obstacle_type.fist)
		ds_list_add(available_stages,obstacle_type.rockstar)
	}
	
	stages++
	
}	