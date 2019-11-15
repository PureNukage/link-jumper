spawn = ds_queue_create()
spawn_time = ds_queue_create()

obstacles = ds_list_create()

obstacles[| obstacle_type.fud] = s_fud
obstacles[| obstacle_type.link] = s_chainlink
obstacles[| obstacle_type.duck] = s_duck
obstacles[| obstacle_type.fist] = s_fist
obstacles[| obstacle_type.rockstar] = s_rockstar
obstacles[| obstacle_type.shadowfork] = s_shadowfork

obstacles_total = ds_list_size(obstacles)

amount_total = 3

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

obstacle_queue(queue,60,90)

queue[obstacle_type.fud,obstacle_amount.dubs] = 6
queue[obstacle_type.fud,obstacle_amount.trips] = 2

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,60,90)

queue[obstacle_type.fud,obstacle_amount.dubs] = 2
queue[obstacle_type.fud,obstacle_amount.trips] = 6

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,60,90)

#endregion
#region Stage 1

queue[obstacle_type.duck,obstacle_amount.solo] = 4
queue[obstacle_type.fud,obstacle_amount.dubs] = 5

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,30,60)

queue[obstacle_type.shadowfork,obstacle_amount.dubs] = 5
queue[obstacle_type.fud,obstacle_amount.trips] = 3

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,30,60)

queue[obstacle_type.fist,obstacle_amount.dubs] = 2
queue[obstacle_type.rockstar,obstacle_amount.trips] = 8

queue[obstacle_type.link,obstacle_amount.solo] = 3
obstacle_queue(queue,30,60)

#endregion
#region Stage 2

queue[obstacle_type.fud,obstacle_amount.solo] = 6
queue[obstacle_type.duck,obstacle_amount.dubs] = 5

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,20,45)

queue[obstacle_type.duck,obstacle_amount.dubs] = 6
queue[obstacle_type.fud,obstacle_amount.trips] = 5

queue[obstacle_type.link,obstacle_amount.solo] = 1

queue[obstacle_type.fud,obstacle_amount.dubs] = 4
queue[obstacle_type.fud,obstacle_amount.trips] = 9

queue[obstacle_type.link,obstacle_amount.solo] = 1

obstacle_queue(queue,20,45)

#endregion

//	Estimate length of the game
var _seconds = floor(queue_time/60)
var _frames = queue_time - (_seconds*60)
var _minutes = floor(_seconds/60)
_seconds = _seconds - _minutes*60
var _max_score = queue_time/6
show_debug_message("estimated length: "+string(_minutes)+" minutes, "+string(_seconds)+" seconds and "+string(_frames)+"frames")
show_debug_message("estimated score: "+string(_max_score))
