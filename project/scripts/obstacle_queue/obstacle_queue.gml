var _queue = argument[0]
var gap0 = argument[1]
var gap1 = argument[2]

var remainder_list = ds_list_create()

for(var type=0;type<obstacles_total;type++) {
	//	Get the total of obstacles of this type we're putting into the queue
	var total = 0
	for(var i=0;i<amount_total;i++) {
		if (_queue[type,i] > 0) total += _queue[type,i]
	}
	
	for(var obs=0;obs<total;obs++) {
		//	Update the remainder list
		ds_list_clear(remainder_list)		
		for(var amount=0;amount<amount_total;amount++) {
			if (_queue[type,amount] > 0) ds_list_add(remainder_list,amount+1)
		}	
		
		#region	If this is Stage 0 and we have a solo fud make it first in queue
		//if queue_stage == 0 and queue[obstacle_type.fud,obstacle_amount.solo] > 0 and obs == 0 {
		//	ds_queue_enqueue(spawn_time,queue_time)
		//	ds_queue_enqueue(spawn,type)
		//	queue_time += 10
		//	queue[obstacle_type.fud,obstacle_amount.solo]--
		//	continue
		//} 
		#endregion
		
		var which = ds_list_find_value(remainder_list,irandom_range(0,ds_list_size(remainder_list)-1))
		
		for(var i=0;i<which;i++) {
			ds_queue_enqueue(spawn_time,queue_time)
			ds_queue_enqueue(spawn,type)
			queue_time += 10
		}
		
		_queue[type,which-1]--
		
		var gap = irandom_range(gap0,gap1)
		queue_time += gap
		
	}	
}

for(var a=0;a<obstacles_total;a++) {
	for(var b=0;b<amount_total;b++) {
		queue[a,b] = 0
	}
}