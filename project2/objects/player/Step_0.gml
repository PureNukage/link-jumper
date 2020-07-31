switch(app.stage) 
{
	case 0:
		//	Jump
		if input.jump and onGround {
			vspd = -10
			jump = 1
			onGround = false
			debug.log("Jumping!")
		}

		//	Long Jump
		if input.jumpHold {
			jump++
	
			if jump > 4 and jump < 10 {
				vspd--	
			}
		}

		//	In the air
		if !onGround {
	
			y += vspd
			vspd += grav
	
			//	Determine sprite
			if vspd < 0 sprite_index = s_sergey_jump0
			else sprite_index = s_sergey_jump1
	
			//	Check for landing on the ground
			if y >= ground {
				y = ground
				onGround = true
				sprite_index = s_sergey_run
				vspd = 0
				jump = 0
			}
		}
			
		//	Collisions
		if place_meeting(x,y,obstacle) {
			var Obs = instance_place(x,y,obstacle)
			if Obs.sprite_index == s_chainlink {
				vspd = -10
				onGround = false
				with Obs instance_destroy()
			}
		}	
	break	
	case 1:
	
		// Move left and right
		var hspd = input.keyRight - input.keyLeft
		
		if input.keyDown y += 3
		
		x += hspd * 5
		
		if hspd != 0 {
			image_xscale = hspd	
		}
		
		if vspd < 0 {
			//sprite_index = s_sergey_flying
			image_speed = (abs(vspd) / 20) * 1
			grav = 0.3
		}
		
		else {
			grav = 0.05
		}
		
		//	In the air
		if !onGround {
	
			y += vspd
			vspd += grav
			
			y = clamp(y,60,room_height)
			
			//	Going up
			if vspd < 0 {
				var skyID = layer_get_id("Sky")
				var cityID = layer_get_id("City")
				var roadID = layer_get_id("Road")
				var lightpolesID = layer_get_id("Lightpoles")
				
				var oldSkyY = layer_get_y(skyID)
				var oldCityY = layer_get_y(cityID)
				var oldRoadY = layer_get_y(roadID)
				var oldLightpolesY = layer_get_y(lightpolesID)
				
				oldSkyY -= vspd
				oldCityY -= vspd
				oldRoadY -= vspd
				oldLightpolesY -= vspd
				
				layer_y(skyID, oldSkyY)
				layer_y(cityID, oldCityY)
				layer_y(roadID, oldRoadY)
				layer_y(lightpolesID, oldLightpolesY)
			}
			//	Falling down
			else {
				sprite_index = s_sergey_jump1
			}
	
			//	Check for landing on the ground
			if y >= ground {
				y = ground
				onGround = true
				vspd = 0
				jump = 0
			}
		}
		
		//	Collisions
		if place_meeting(x,y,obstacle) {
			var Obs = instance_place(x,y,obstacle)
			if Obs.sprite_index == s_chainlink {
				if !Obs.sparkle {
					vspd = -10
					sprite_index = s_sergey_jump0
				}
				else {
					vspd = -15
					sprite_index = s_sergey_flying
				}
				onGround = false
				with Obs instance_destroy()
			}
		}
		
	break	
	
	
}