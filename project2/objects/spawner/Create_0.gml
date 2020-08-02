var spawnTime = 120
spawnTimer = spawnTime

spawnTimer2 = irandom_range(60,90)

spawnTimerChainlinks = irandom_range(45,75)

Direction = 0

function spawn() {
	
	spawnTimer--
	
	if app.stage == 1 {
		sprite_index = s_chopper
		if Direction = 0 Direction = 1	
	}
	
	switch(app.stage) 
	{
		case 0:
	
		if spawnTimer == 0 {
		
			var Obstacle = instance_create_layer(x,y+60,"Instances",obstacle)
			//Obstacle.sprite_index = s_chainlink
		
			spawnTimer = 120
		}	
		break
		
		case 1:
		
			x += Direction * 4
			
			y = 20
			
			image_xscale = Direction
			
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
			
			if spawnTimer == 0 {
				
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
	}
}