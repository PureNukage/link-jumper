if alive { 
	switch(app.stage) 
	{
		#region RUNNING STAGE
		case 0:
			
			if !damaged { 
				// Move left and right
				var Hspd = input.keyRight - input.keyLeft
		
				var End = spawner.x-200
				if x < End image_speed = (x / End) * 2
				else image_speed = 2
				if x < 100 image_speed = .5
			
				x += Hspd * 3
			}
			else {
				
				bounce()

				damagedTimer--
				if damagedTimer == 0 {
					damagedTimer = -1
					damaged = false
				}
				
				x -= 3	
			}
			
			x = clamp(x, -100, spawner.x-100)
			
			if x < -50 {
				alive = false	
			}
		
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
					Obs.destroy()
				}
				else {
					var Direction = point_direction(Obs.x,Obs.y, -100,player.y)
					var Force = 12
					bounceSet(Direction, Force)
					damaged = true
					damagedTimer = 30
					Obs.destroy()
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
			
			x = clamp(x, 0, display_get_gui_width())
		
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
				
			y = clamp(y,room_height/2-160,room_height/2+160)	
		
			//	In the air
			if !onGround {
	
				y += vspd
				vspd += grav
			
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
					var heavensWorldID = layer_get_id("Heavens_world")
					var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
					var heavensCloudsID = layer_get_id("Heavens_clouds")
				
					var oldSkyY = layer_get_y(skyID)
					var oldCityY = layer_get_y(cityID)
					var oldRoadY = layer_get_y(roadID)
					var oldLightpolesY = layer_get_y(lightpolesID)
					var starsY = layer_get_y(starsID)
					
					//var heavensWorldX = layer_get_x(heavensWorldID)
					var heavensWorldY = layer_get_y(heavensWorldID)
					//var heavensPillarX = layer_get_x(heavensFrontPillarID)
					var heavensPillarY = layer_get_y(heavensFrontPillarID)
					//var heavensCloudsX = layer_get_x(heavensCloudsID)
					var heavensCloudsY = layer_get_y(heavensCloudsID)
				
					oldSkyY -= vspd
					oldCityY -= vspd
					oldRoadY -= vspd
					oldLightpolesY -= vspd
					starsY -= vspd
					heavensCloudsY -= vspd
				
					layer_y(skyID, oldSkyY)
					layer_y(cityID, oldCityY)
					layer_y(roadID, oldRoadY)
					layer_y(lightpolesID, oldLightpolesY)
					layer_y(starsID, starsY)
					layer_y(heavensCloudsID, heavensCloudsY)
				
					var spaceMergeStartY = 1000
					var spaceMergeEndY = 2000
					
					var heavensMergeStartY = spaceMergeEndY + 500 
					var heavensMergeEndY = heavensMergeStartY + 500
				
					var backID = layer_background_get_id(starsID)
					var _skyID = layer_background_get_id(skyID)
					var _cloudsID = layer_background_get_id(heavensCloudsID)
					var _worldID = layer_background_get_id(heavensWorldID)
					var _pillarID = layer_background_get_id(heavensFrontPillarID)
				
					//	All sky and no stars
					if oldRoadY < spaceMergeStartY {
						var starsAlpha = 0
						layer_background_alpha(backID,starsAlpha)
						var skyAlpha = 1
						layer_background_alpha(_skyID,skyAlpha)
					
					} 
					//	Merging between sky and stars
					else if oldRoadY >= spaceMergeStartY and oldRoadY < spaceMergeEndY {
						var starsAlpha = ((oldRoadY-spaceMergeStartY) / (spaceMergeEndY-spaceMergeStartY)) * 1
						layer_background_alpha(backID,starsAlpha)
						var skyAlpha = 1 - starsAlpha
						layer_background_alpha(_skyID,skyAlpha)
						
						
						layer_background_alpha(_cloudsID,0)
						layer_background_alpha(_worldID,0)
						layer_background_alpha(_pillarID,0)
					} 
					//	in spaaaaaccce
					else if oldRoadY > spaceMergeEndY {
						
						if oldRoadY < heavensMergeStartY {
							layer_background_alpha(_skyID,0)
							layer_background_alpha(backID,1)
						} else if oldRoadY > heavensMergeStartY and oldRoadY < heavensMergeEndY { 
							var cloudsAlpha = ((oldRoadY-heavensMergeStartY) / (heavensMergeEndY-heavensMergeStartY)) 
							var starsAlpha = 1 - cloudsAlpha
							layer_background_alpha(backID,starsAlpha)
							layer_background_alpha(_cloudsID,cloudsAlpha)	
						} else if oldRoadY > heavensMergeEndY { 
							layer_background_alpha(backID,0)
							layer_background_alpha(_cloudsID,1)
							
							//	We've reached the heavens, turn alpha on and position the world
							if layer_background_get_alpha(_worldID) == 0 {
								layer_background_alpha(_worldID, 1)
								layer_background_alpha(_pillarID, 1)
								
								layer_y(heavensWorldID, -400)
								layer_y(heavensFrontPillarID, -400)
								heavensWorldY = layer_get_y(heavensWorldID)
								heavensPillarY = layer_get_y(heavensFrontPillarID)
							} else {
								
								//	Lets move the heaven world/pillar up
								heavensWorldY -= vspd
								heavensPillarY -= vspd
								layer_y(heavensWorldID, heavensWorldY)
								layer_y(heavensFrontPillarID, heavensPillarY)
								
								if heavensWorldY >= 0 {
									app.switch_stage(2)
								}
							}
						}
						
						
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
				
			bounce()
		
			//	Collisions
			if place_meeting(x,y,obstacle) {
				var Obs = instance_place(x,y,obstacle)
				if sprite_index == s_sergey_flying {
					with Obs instance_destroy()
				} else {
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
					//	not a chainlink cube
					else {
						damaged = true
						damagedTimer = 30
						vspd = 0
						var Direction = point_direction(Obs.x,Obs.y, player.x,player.y)
						var Force = 12
						bounceSet(Direction, Force)
						instance_destroy(Obs)
					}
				}
			}
			
			//	Damaged
			if damaged {
				damagedTimer--
				if damagedTimer == 0 {
					damagedTimer = -1
					damaged = false
				}
			}
		
		break
		#endregion
		
		#region HEAVEN STAGE
			case 2:
			
			if !gui.showMessage {
			
				depth = -(y + sprite_get_height(sprite_index)/2)
				depth = -y - 62
			
				var fpID = layer_get_id("Heavens_frontpillar")
				layer_depth(fpID,depth-1)
			
				// Move left and right
				var hspd = input.keyRight - input.keyLeft
				var Vspd = input.keyDown - input.keyUp
			
				xx += hspd * 5
				yy += Vspd * 5
			
				if hspd != 0 {
					image_xscale = hspd	
					sprite_index = s_sergey_run
				} else {
					sprite_index = s_sergey_idle		
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
			
				applyMovementAndCollide()
			}
				
			break
		#endregion
	
	}
}
//	Dead
else {
	
	image_angle += 1
	vspd += 0.4
	y += vspd
	
	if y > room_height { 
		gui.showRestart = true
	}
	
}