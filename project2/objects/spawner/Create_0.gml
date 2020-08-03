var spawnTime = 120
spawnTimer = spawnTime

spawnTimer2 = irandom_range(60,90)

spawnTimerChainlinks = irandom_range(45,75)

Direction = 0

queueObs = ds_queue_create()

built = false

delayTimer = 0

function createQueueObject(Time, link_cube) constructor {
	spawnTime = Time
	linkcube = link_cube
}

function queueObject(object) {
	ds_queue_enqueue(queueObs, object)
}

function queueCheck() {
	
	if !ds_queue_empty(queueObs) {
		var nextQueue = ds_queue_head(queueObs)
	
		var queueSpawnTime = nextQueue.spawnTime
		var queueSpawnLink = nextQueue.linkcube
	
		if time.stream >= queueSpawnTime {
		
			var Obstacle = instance_create_layer(x,y+60,"Instances",obstacle)
		
			if queueSpawnLink {
				var linkCube = instance_create_layer(Obstacle.x,y-60,"Instances",obstacle)
				linkCube.bouncing = true
				linkCube.bouncingHoverID = Obstacle
				linkCube.sprite_index = s_chainlink
				linkCube.image_xscale = .5
				linkCube.image_yscale = .5
			}
		
			ds_queue_dequeue(queueObs)
			
			built = false
		
		}
	}
	
}
	
var Time = 30
var singleFUD = new createQueueObject(Time, false)
queueObject(singleFUD)

Time += 120
var singleFUD = new createQueueObject(Time, false)
queueObject(singleFUD)

Time += 120
var singleFUD = new createQueueObject(Time, false)
queueObject(singleFUD)