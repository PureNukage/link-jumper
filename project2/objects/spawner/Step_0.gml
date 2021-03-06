spawnTimer--
	
if app.stage == 1 {
	//sprite_index = s_chopper
	if Direction = 0 Direction = 1	
}

if lossState == -1 {
	
	switch(app.stage) 
{
	#region RUNNING STAGE 
		case 0:
			
			queueCheck()
			
			if !built and !ds_queue_empty(queueObs) {
				
				if time.seconds_stream < 10 {
					
					while !built {
						
						var nextSpawn = ds_queue_tail(queueObs)
						var nextSpawnTime = nextSpawn.spawnTime
						
						var spacerTime = 120
						
						var SpawnTime = nextSpawnTime + spacerTime
						
						if ((nextSpawnTime) / 60) < 12 {
							
							var obs = new createQueueObject(SpawnTime, false)
							
							queueObject(obs)
							
						} else {
							built = true	
						}
						
					}	
				}
				
				else if time.seconds_stream < 30 {
					while !built {
						var nextSpawn = ds_queue_tail(queueObs)
						var nextSpawnTime = nextSpawn.spawnTime
						
						var spacerTime = 120
						
						var SpawnTime = nextSpawnTime + spacerTime
						
						if ((nextSpawnTime) / 60) < 32 {
							
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
						
							SpawnTime += 15
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
							
						} else {
							built = true	
						}	
					}
				}
				
				else if time.seconds_stream < 42 {
					var amount = 0
					while !built {
						var nextSpawn = ds_queue_tail(queueObs)
						var nextSpawnTime = nextSpawn.spawnTime
						
						var spacerTime = 120
						
						var SpawnTime = nextSpawnTime + spacerTime
						
						if ((nextSpawnTime) / 60) < 45 {
							
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
						
							SpawnTime += 12
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
						
							SpawnTime += 12
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
							
							amount++
							
						} else {
							built = true	
							debug.log("DEBUG amount of triple objects: "+string(amount))
						}	
					}
				}
					
				else if time.seconds_stream < 70 {
					while !built {
						var nextSpawn = ds_queue_tail(queueObs)
						var nextSpawnTime = nextSpawn.spawnTime
						
						var spacerTime = 160
						
						var SpawnTime = nextSpawnTime + spacerTime
						
						if ((nextSpawnTime) / 60) < 74 {
							
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
						
							SpawnTime += 15
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
						
							SpawnTime += 15
							var obs = new createQueueObject(SpawnTime, true)
							queueObject(obs)
							
							SpawnTime += 15
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
							
							SpawnTime += 15
							var obs = new createQueueObject(SpawnTime, false)
							queueObject(obs)
							
						} else {
							built = true	
						}	
					}
				}
					
				//	Transition into stage 1
				else {
					
					//if !ds_queue_empty(queueObs) { ds_queue_clear(queueObs) }
					if instance_exists(obstacle) instance_deactivate_object(obstacle)	
					
					
					delayTimer++					
					if delayTimer > 180 {
					
						spawner.x += 2
					
						{	//	Mess with the background layers
							var skyID = layer_get_id("Sky")
							var cityID = layer_get_id("City")
							var roadID = layer_get_id("Road")
							var lightpolesID = layer_get_id("Lightpoles")
							//var starsID = layer_get_id("Stars")
							//var heavensWorldID = layer_get_id("Heavens_world")
							//var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
							//var heavensCloudsID = layer_get_id("Heavens_clouds")
						
							var Lerp = 0.1
							var Hspeed = layer_get_hspeed(skyID)
							Hspeed = lerp(Hspeed,0,Lerp)
							layer_hspeed(skyID, Hspeed)
						
							var Lerp = 0.1
							var Hspeed = layer_get_hspeed(cityID)
							Hspeed = lerp(Hspeed,0,Lerp)
							layer_hspeed(cityID, Hspeed)
						
							var Lerp = 0.1
							var Hspeed = layer_get_hspeed(roadID)
							Hspeed = lerp(Hspeed,0,Lerp)
							layer_hspeed(roadID, Hspeed)
						
							var Lerp = 0.1
							var Hspeed = layer_get_hspeed(lightpolesID)
							Hspeed = lerp(Hspeed,0,Lerp)
							layer_hspeed(lightpolesID, Hspeed)
						}
					
						if spawner.x >= display_get_gui_width()/2 + 480 {
							if instance_exists(obstacle) with obstacle instance_destroy()
							app.switch_stage(1)
						}
					}
					
				}
					
			}
			
			else if time.seconds_stream > 90 {
				delayTimer++					
				if delayTimer > 180 {
					
					spawner.x += 2
					
					{	//	Mess with the background layers
						var skyID = layer_get_id("Sky")
						var cityID = layer_get_id("City")
						var roadID = layer_get_id("Road")
						var lightpolesID = layer_get_id("Lightpoles")
						//var starsID = layer_get_id("Stars")
						//var heavensWorldID = layer_get_id("Heavens_world")
						//var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
						//var heavensCloudsID = layer_get_id("Heavens_clouds")
						
						var Lerp = 0.1
						var Hspeed = layer_get_hspeed(skyID)
						Hspeed = lerp(Hspeed,0,Lerp)
						layer_hspeed(skyID, Hspeed)
						
						var Lerp = 0.1
						var Hspeed = layer_get_hspeed(cityID)
						Hspeed = lerp(Hspeed,0,Lerp)
						layer_hspeed(cityID, Hspeed)
						
						var Lerp = 0.1
						var Hspeed = layer_get_hspeed(roadID)
						Hspeed = lerp(Hspeed,0,Lerp)
						layer_hspeed(roadID, Hspeed)
						
						var Lerp = 0.1
						var Hspeed = layer_get_hspeed(lightpolesID)
						Hspeed = lerp(Hspeed,0,Lerp)
						layer_hspeed(lightpolesID, Hspeed)
					}
					
					if spawner.x >= display_get_gui_width()/2 + 480 {
						if instance_exists(obstacle) with obstacle instance_destroy()
						app.switch_stage(1)
					}
				}	
			}
			
			debug.log("DEBUG time.seconds_stream: "+string(time.seconds_stream))
		break
	#endregion
		
	#region FLYING STAGE 
		case 1:
		
			x += Direction * 4
			
			y = 20
			
			//image_xscale = Direction
			
			if sprite_index = s_rocketship {
				image_xscale = .4
				image_yscale = .4
			} else {
				image_xscale = 1 * Direction
				image_yscale = 1
			}
			
			spawnTimer2--
			
			if Direction == 1 and x >= (camera.width - sprite_get_width(sprite_index)/4) Direction = -1
			if Direction == -1 and x <= 0 + sprite_get_width(sprite_index)/4 Direction = 1
			
			if spawnTimer2 == 0 {
				
				var randomX = irandom_range(30,camera.width-30)
				var Obstacle = instance_create_layer(randomX,y,"Instances",obstacle)
				//Obstacle.sprite_index = s_chainlink
				Obstacle.image_xscale = 0.5
				Obstacle.image_yscale = 0.5
				
				spawnTimer2 = irandom_range(90,120)
				
			}
			
			if spawnTimer <= 0 {
				
				var Obstacle = instance_create_layer(x,y,"Instances",obstacle)
				Obstacle.sprite_index = s_chainlink
				Obstacle.sparkle = true
				Obstacle.image_xscale = 0.5
				Obstacle.image_yscale = 0.5
			
				spawnTimer = 180
				
			}
			
			spawnTimerChainlinks--
			if spawnTimerChainlinks == 0 {
				
				var spawnX = -1
				if player.x >= camera.width/2 {
					spawnX = irandom_range(100, camera.width/2-100)	
				} else {
					spawnX = irandom_range(camera.width/2 + 100, camera.width-100)
				}
				
				var Obstacle = instance_create_layer(spawnX,y,"Instances",obstacle)
				Obstacle.sprite_index = s_chainlink
				Obstacle.image_xscale = 0.5
				Obstacle.image_yscale = 0.5
				
				spawnTimerChainlinks = irandom_range(45,75)
			}
			
		break	
	#endregion
	
	#region FALLING STAGE
		case 3:
		
			if !player.atStation and player.fallingStage == 0 {
			
				x += Direction * 4
			
				y = room_height + 100
			
				if Direction == 1 and x >= (camera.width - sprite_get_width(sprite_index)/4) Direction = -1
				if Direction == -1 and x <= 0 + sprite_get_width(sprite_index)/4 Direction = 1
			
			
				spawnTimerChainlinks--
				if spawnTimerChainlinks == 0 {
				
					var spawnX = irandom_range(100, camera.width-100)	
				
					var Obstacle = instance_create_layer(spawnX,y,"Instances",obstacle)
					Obstacle.sprite_index = s_chainlink
					Obstacle.image_xscale = 0.5
					Obstacle.image_yscale = 0.5
				
					spawnTimerChainlinks = irandom_range(45,75)
				}
			}
			
		break
	#endregion
}
	
} else {
	switch(lossState)
	{
		//	Sliding back into camera view
		case 0:
			x = lerp(x, 500, 0.03)
			if x < 510 {
				lossState = 1	
				lossLaugh = 0
				laughTimer = 10
			}
		break
		//	Pepe laughing
		case 1:
			laughTimerTotal--
			
			laughTimer--
			
			if laughTimer == 0 {
				laughTimer = 10
				lossLaugh++
				if lossLaugh >= 3 {
					lossLaugh = 0
				}
			}
			
			if laughTimerTotal == 0 {
				lossState = 2	
			}
		break
		//	Zoom off
		case 2:
		
			x = lerp(x, display_get_gui_width() + 200, 0.09)
			
			if x > display_get_gui_width() + 200 - 50 {
				lossState = 3	
			}
		break
	}
}