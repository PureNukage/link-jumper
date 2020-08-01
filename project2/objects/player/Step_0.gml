switch(app.stage) 
{
	#region RUNNING STAGE
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
				if running sprite_index = s_sergey_run
				else sprite_index = s_sergey_walk
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
	#endregion
	
	#region FLYING STAGE
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
			
			y = clamp(y,room_height/2-160,room_height/2+160)
			
			//	Going up
			if vspd < 0 {
			}
			//	Falling down
			else {
				sprite_index = s_sergey_jump1
			}
			
			{	//	Mess with the background layers
				var skyID = layer_get_id("Sky")
				var cityID = layer_get_id("City")
				var roadID = layer_get_id("Road")
				var lightpolesID = layer_get_id("Lightpoles")
				var starsID = layer_get_id("Stars")
				
				var oldSkyY = layer_get_y(skyID)
				var oldCityY = layer_get_y(cityID)
				var oldRoadY = layer_get_y(roadID)
				var oldLightpolesY = layer_get_y(lightpolesID)
				var starsY = layer_get_y(starsID)
				
				oldSkyY -= vspd
				oldCityY -= vspd
				oldRoadY -= vspd
				oldLightpolesY -= vspd
				starsY -= vspd
				
				layer_y(skyID, oldSkyY)
				layer_y(cityID, oldCityY)
				layer_y(roadID, oldRoadY)
				layer_y(lightpolesID, oldLightpolesY)
				layer_y(starsID, starsY)
				
				var spaceMergeStartY = 2000
				var spaceMergeEndY = 7000
				
				var backID = layer_background_get_id(starsID)
				var _skyID = layer_background_get_id(skyID)
				
				if oldRoadY < spaceMergeStartY {
					var starsAlpha = 0
					layer_background_alpha(backID,starsAlpha)
					var skyAlpha = 1
					layer_background_alpha(_skyID,skyAlpha)
					
				} else if oldRoadY >= spaceMergeStartY and oldRoadY < spaceMergeEndY {
					var starsAlpha = (oldRoadY/spaceMergeEndY) * 1
					layer_background_alpha(backID,starsAlpha)
					var skyAlpha = 1 - starsAlpha
					layer_background_alpha(_skyID,skyAlpha)
				} else if oldRoadY > spaceMergeEndY {
					layer_background_alpha(_skyID,0)
					layer_background_alpha(backID,1)
				}
			}
				
			with obstacle {
				y -= other.vspd / 5
			}
	
			//	Check for landing on the ground
			var roadID = layer_get_id("Road")
			var roadY = layer_get_y(roadID)
			debug.log("roadY: "+string(roadY))
			if layer_get_y(roadID) <= -180 {
				if sprite_index != s_sergey_idle sprite_index = s_sergey_idle
				y = ground
				onGround = true
				vspd = 0
				jump = 0
			}
		}
		//	On the ground
		else {
			image_speed = 1
			if hspd != 0 {
				sprite_index = s_sergey_walk
			} else {
				sprite_index = s_sergey_idle	
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
	#endregion
	
}