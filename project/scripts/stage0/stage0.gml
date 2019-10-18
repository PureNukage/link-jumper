var _queue = argument[0]


var solos = 1		//	This is the amount of solo fuds that will spawn 
var dubs = 1		//	This is the amount of x2 fuds that will spawn 
var trips = 1		//	This is the amount of x3 fuds that will spawn 

var _time = 10		//	The initial stream value (for other stages it should init as time.stream)

var total = solos + dubs + trips	//	Total amount of obstacles to spawn this stage

var remainder_list = ds_list_create()

for(var i=0;i<total;i++) {
	
	//	Update the remainder list 
	ds_list_clear(remainder_list)
	if (solos > 0 and ds_list_find_index(remainder_list,1) == -1) ds_list_add(remainder_list,1)
	if (dubs > 0 and ds_list_find_index(remainder_list,2) == -1) ds_list_add(remainder_list,2)
	if (trips > 0 and ds_list_find_index(remainder_list,3) == -1) ds_list_add(remainder_list,3)
	
	// If this is the first obstacle to be queued and a solo obstacle exists...
	if i == 0 and solos > 0 {
		ds_queue_enqueue(spawn_time,_time)
		ds_queue_enqueue(spawn,obstacle_type.fud)
		_time += 10
		solos--
	} else {	//	If this is not the first obstacle to be queued or no solos exist
	//	Choose which type to spawn
		var which = ds_list_find_value(remainder_list,irandom_range(0,ds_list_size(remainder_list)-1))
		
		for(var c=0;c<which;c++) {
			ds_queue_enqueue(spawn_time,_time)
			ds_queue_enqueue(spawn,obstacle_type.fud)
			_time += 10	
		}
		
		switch(which)
		{
			case 1:	solos--	break
			case 2: dubs-- break
			case 3: trips-- break
		}
		
	}	
	
	show_debug_message("solos left: "+string(solos))
	show_debug_message("dubs left: "+string(dubs))
	show_debug_message("trips left: "+string(trips))
	show_debug_message("")
	
	//	Random gap in between chunks
	var gap = irandom_range(30,60)
	_time += gap
}	

var _seconds = floor(_time/60)
var _frames = _time - (_seconds*60)
var _minutes = floor(_seconds/60)
_seconds = _seconds - _minutes*60
show_debug_message("stage0 length: "+string(_minutes)+" minutes, "+string(_seconds)+" seconds and "+string(_frames)+"frames")
show_debug_message("")