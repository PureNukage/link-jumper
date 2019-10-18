spawn = ds_queue_create()
spawn_time = ds_queue_create()

obstacles = ds_list_create()

obstacles[| obstacle_type.fud] = s_fud
obstacles[| obstacle_type.link] = s_chainlink

obstacles_total = ds_list_size(obstacles)

amount_total = 3

queue_stage = 0
queue_time = 10

queue = []

for(var a=0;a<obstacles_total;a++) {
	for(var b=0;b<amount_total;b++) {
		queue[a,b] = 0
	}
}

#region Stage 0 

queue[obstacle_type.fud,obstacle_amount.solo] = 6
queue[obstacle_type.fud,obstacle_amount.dubs] = 2

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue)

queue[obstacle_type.fud,obstacle_amount.dubs] = 6
queue[obstacle_type.fud,obstacle_amount.trips] = 2

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue)

queue[obstacle_type.fud,obstacle_amount.dubs] = 2
queue[obstacle_type.fud,obstacle_amount.trips] = 6

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue)

#endregion