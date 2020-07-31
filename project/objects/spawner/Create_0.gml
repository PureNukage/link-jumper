spawn = ds_queue_create()
spawn_time = ds_queue_create()

obstacles = ds_list_create()

//obstacles[| obstacle_type.fud] = s_fud
//obstacles[| obstacle_type.link] = s_chainlink
//obstacles[| obstacle_type.duck] = s_duck
//obstacles[| obstacle_type.fist] = s_fist
//obstacles[| obstacle_type.rockstar] = s_rockstar
//obstacles[| obstacle_type.shadowfork] = s_shadowfork

obstacles[| obstacle_type.fud] = s_chainlink
obstacles[| obstacle_type.link] = s_chainlink
obstacles[| obstacle_type.duck] = s_chainlink
obstacles[| obstacle_type.fist] = s_chainlink
obstacles[| obstacle_type.rockstar] = s_chainlink
obstacles[| obstacle_type.shadowfork] = s_chainlink

obstacles_total = ds_list_size(obstacles)

amount_total = 3

queue_time = 10

queue = []

for(var a=0;a<obstacles_total;a++) {
	for(var b=0;b<amount_total;b++) {
		queue[a,b] = 0
	}
}

queue_total = 8
queue_solos = queue_total
queue_dubs = 0
queue_trips = 0
queue_gap0 = 70
queue_gap1 = 80

available_stages = ds_list_create()
//available_stages[| 0] = obstacle_type.fud
available_stages[| 0] = obstacle_type.duck
available_stages[| 1] = obstacle_type.shadowfork

stage(obstacle_type.fud,queue_solos,queue_dubs,queue_trips,queue_gap0,queue_gap1)
//stage(obstacle_type.duck,7,1,0,65,75)
//stage(obstacle_type.shadowfork,6,2,0,60,70)

stages = 1

//	Estimate length of the game
var _seconds = floor(queue_time/60)
var _frames = queue_time - (_seconds*60)
var _minutes = floor(_seconds/60)
_seconds = _seconds - _minutes*60
var _max_score = queue_time/6
show_debug_message("estimated length: "+string(_minutes)+" minutes, "+string(_seconds)+" seconds and "+string(_frames)+"frames")
show_debug_message("estimated score: "+string(_max_score))
