if alive { 
	switch(app.stage) 
	{
		#region RUNNING STAGE
		case 0:
			
			if !damaged { 
				// Move left and right
				//var Hspd = input.keyRight - input.keyLeft
		
				var End = spawner.x-200
				if x < End image_speed = (x / End) * 2
				else image_speed = 2
				if x < 100 image_speed = .5
				
				var Speed = 3
				if (os_type == os_android or os_type == os_ios) Speed = 5
				
				//x += Hspd * Speed
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
			
			if x < startingX and !damaged {
				x += 5	
			}
			
			x = clamp(x, -100, spawner.x-100)
			
			if x < -50 {
				alive = false	
			}
		
			//	Jump
			if (input.jump or input.keyUp) and onGround {
				vspd = -11
				if (os_type == os_android or os_type == os_ios) vspd = -12
				jump = 1
				onGround = false
				debug.log("Jumping!")
			}

			//	Long Jump
			if input.jumpHold or input.keyUp {
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
			if !god {
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
					
					var heavensMergeStartY = spaceMergeEndY + 1500 
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
						
						if spawner.sprite_index != s_chopper spawner.sprite_index = s_chopper
					} 
					//	in spaaaaaccce
					else if oldRoadY > spaceMergeEndY {
						
						if spawner.sprite_index != s_rocketship spawner.sprite_index = s_rocketship
						
						if oldRoadY < heavensMergeStartY {
							layer_background_alpha(_skyID,0)
							layer_background_alpha(backID,1)
							
							//	Saturn
							//var saturnY = (heavensMergeStartY - spaceMergeEndY)/2 + spaceMergeEndY
							
							if oldRoadY < heavensMergeStartY {
								
								var saturnID = layer_get_id("Saturn")
								layer_y(saturnID, layer_get_y(saturnID) - vspd)
								
							}
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
					//y -= other.vspd / 5
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
			
			if zoneJumping == -1 {
				if !gui.showMessage {
					
				image_speed = 1
			
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
				
				if place_meeting(x,y,zone) {
					zoneJumping = 0
					zoneJumpingTimer = 120
					vspd -= 10
					if instance_exists(zone) instance_destroy(zone)
				}
			} else image_speed = 0
			}
			
			else {
				switch(zoneJumping)
				{
					case 0:
						sprite_index = s_sergey_jump0
						
						vspd += grav
						
						var heavensWorldID = layer_get_id("Heavens_world")
						var heavensCloudsID = layer_get_id("Heavens_clouds")
						var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
						
						layer_y(heavensWorldID, layer_get_y(heavensWorldID) - vspd)
						layer_y(heavensCloudsID, layer_get_y(heavensCloudsID) - vspd)
						layer_y(heavensFrontPillarID, layer_get_y(heavensFrontPillarID) - vspd)
						harambe.y -= vspd
						
						zoneJumpingTimer--
						if zoneJumpingTimer == 0 {
							zoneJumping++
							zoneJumpingTimer = 120
						}
					break
					case 1:
						sprite_index = s_sergey_jump1
						
						var Lerp = 0.02
						
						x = lerp(x, 100,Lerp)
						y = lerp(y, 100, Lerp)
						
						vspd += grav
						
						vspd = clamp(vspd, -10, 20)
						
						zoneJumpingTimer--
						if zoneJumpingTimer == 0 {
							zoneJumpingTimer = -1
							zoneJumping++
						}
						
						var heavensWorldID = layer_get_id("Heavens_world")
						var heavensCloudsID = layer_get_id("Heavens_clouds")
						var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
						
						layer_y(heavensWorldID, layer_get_y(heavensWorldID) - vspd)
						layer_y(heavensCloudsID, layer_get_y(heavensCloudsID) - vspd)
						layer_y(heavensFrontPillarID, layer_get_y(heavensFrontPillarID) - vspd)
						
						
						
					break
					case 2:
						
						sprite_index = s_sergey_flying
						image_angle = 180
						image_speed = 0
						
						var heavensWorldID = layer_get_id("Heavens_world")
						var heavensCloudsID = layer_get_id("Heavens_clouds")
						var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
						
						layer_y(heavensWorldID, layer_get_y(heavensWorldID) - vspd)
						layer_y(heavensCloudsID, layer_get_y(heavensCloudsID) - vspd)
						layer_y(heavensFrontPillarID, layer_get_y(heavensFrontPillarID) - vspd)
						
						layer_x(heavensWorldID, layer_get_x(heavensWorldID) - vspd)
						layer_x(heavensCloudsID, layer_get_x(heavensCloudsID) - vspd)
						layer_x(heavensFrontPillarID, layer_get_x(heavensFrontPillarID) - vspd)
						
						app.switch_stage(3)
						
					break
				}
			}
				
			break
		#endregion
		
		#region FALLING STAGE 
			case 3:
				
				if !done {
					var Hspd = input.keyRight - input.keyLeft
					x += Hspd * 5
					
					x = clamp(x, 0, display_get_gui_width())
				}
				
				//	Falling/space station
				if fallingStage == 0 {
				
					//	Space station
					if vspd >= 60 and !seenStation {
						atStation = true
					
						if instance_exists(obstacle) with obstacle instance_destroy()
					
						if Hspd != 0 image_xscale = Hspd
					
						sprite_index = s_sergey_jump1
						image_angle = 0 
					
						var Vspd = input.keyDown - input.keyUp
						y += Vspd * 5
					
						x = clamp(x, 400, display_get_gui_width())
						y = clamp(y, 0, room_height)
					
						var starsID = layer_get_id("Stars")
						var heavensCloudsID = layer_get_id("Heavens_clouds")
						var _starsID = layer_background_get_id(starsID)
						var _heavensCloudsID = layer_background_get_id(heavensCloudsID)
						layer_background_alpha(_starsID, 1)
						layer_background_alpha(_heavensCloudsID, 0)
					
						if !instance_exists(astronaut) {
							instance_create_layer(349,391, "Instances", astronaut)
							instance_create_layer(213,175, "Instances", station)
							instance_create_layer(631,387, "Instances", wrench)
						}
					
					
					
					}
				
					//	Not at the station
					if !atStation {
					
						image_angle = 180
						
						sprite_index = s_sergey_flying
					
						image_speed = (vspd / 100) * 1
				
						//	Falling color and alpha
						var Lerp = (vspd / 100) * 1
						fallingColor = merge_color(c_yellow,c_red, Lerp)
						fallingAlpha = Lerp
				
						x = clamp(x, 100, display_get_gui_width()-100)
						
						var heavensWorldID = layer_get_id("Heavens_world")
						var heavensCloudsID = layer_get_id("Heavens_clouds")
						var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
						var starsID = layer_get_id("Stars")
						
						layer_y(heavensWorldID, layer_get_y(heavensWorldID) - vspd/2)
						layer_y(heavensCloudsID, layer_get_y(heavensCloudsID) - vspd/2)
						layer_y(heavensFrontPillarID, layer_get_y(heavensFrontPillarID) - vspd/2)
					
						if seenStation layer_y(starsID, layer_get_y(starsID) - vspd/2)
				
						//	Collisions
						if place_meeting(x,y,obstacle) {
						var Obs = instance_place(x,y,obstacle)
						if Obs.sprite_index == s_chainlink {
							vspd += 4
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
					//	At the station
					else {
					if stationTimer > -1 stationTimer--
					
					//	Done with the space station
					if stationTimer == 0 {
						fallingStage = 1
						fallingTimer = 180
						
						seenStation = true
						atStation = false
						if instance_exists(astronaut) instance_destroy(astronaut)
						if instance_exists(station) instance_destroy(station)
						if instance_exists(wrench) instance_destroy(wrench)
						player.sprite_index = s_sergey_flying
						player.image_angle = 180
						player.image_xscale = 1
						player.y = 100
						player.vspd = 60
					}
				}
						
				} 
				
				//	Falling after station
				else if fallingStage == 1 {
					
					if instance_exists(obstacle) with obstacle instance_destroy()
					
					var starsID = layer_get_id("Stars")
					layer_y(starsID, layer_get_y(starsID) - vspd/2)
					
					
					fallingTimer--
					//	Cut to pepe in van
					if fallingTimer <= 0 {
						
						var starsID = layer_get_id("Stars")
						var skyID = layer_get_id("Sky")
						var cityID = layer_get_id("City")
						var lpID = layer_get_id("Lightpoles")
						var roadID = layer_get_id("Road")
						
						var _starsID = layer_background_get_id(starsID)
						var _skyID = layer_background_get_id(skyID)
						var _cityID = layer_background_get_id(cityID)
						var _lpID = layer_background_get_id(lpID)
						var _roadID = layer_background_get_id(roadID)
						
						layer_background_alpha(_starsID, 0)
						layer_background_alpha(_skyID, 1)
						layer_background_alpha(_cityID, 1)
						layer_background_alpha(_lpID, 1)
						layer_background_alpha(_roadID, 1)
						
						layer_y(skyID, 0)
						layer_y(cityID, 0)
						layer_y(roadID, -180)
						layer_y(lpID, 0)
						
						layer_hspeed(skyID, -2)
						layer_hspeed(cityID, -4)
						layer_hspeed(lpID, -8)
						layer_hspeed(roadID, -10)
						
						player.visible = false
						
						var centerX = display_get_gui_width()/2 - 300
						var centerY = 256
						instance_create_layer(centerX,centerY, "Instances", fakevan)
						
						fallingStage = 2
						fallingTimer = 120
						
					}
					
				} 
					
				//	Pepe van shot 1
				else if fallingStage == 2 {
					fallingTimer--
					
					//	done with van, back to Sergey
					if fallingTimer == 0 {
						
						var starsID = layer_get_id("Stars")
						var skyID = layer_get_id("Sky")
						var cityID = layer_get_id("City")
						var lpID = layer_get_id("Lightpoles")
						var roadID = layer_get_id("Road")
						
						var _starsID = layer_background_get_id(starsID)
						var _skyID = layer_background_get_id(skyID)
						var _cityID = layer_background_get_id(cityID)
						var _lpID = layer_background_get_id(lpID)
						var _roadID = layer_background_get_id(roadID)
						
						layer_background_alpha(_starsID, 1)
						layer_background_alpha(_skyID, 0)
						layer_background_alpha(_cityID, 0)
						layer_background_alpha(_lpID, 0)
						layer_background_alpha(_roadID, 0)
						
						visible = true
						
						fallingStage = 3
						fallingTimer = 90
						
						if instance_exists(fakevan) fakevan.visible = false
						
					}
				}
				
				//	Sergey falling again
				else if fallingStage == 3 {
					
					var starsID = layer_get_id("Stars")
					layer_y(starsID, layer_get_y(starsID) - vspd/2)
					
					fallingTimer--
					
					//	Cut back to pepe van for the final time
					if fallingTimer == 0 {
						var starsID = layer_get_id("Stars")
						var skyID = layer_get_id("Sky")
						var cityID = layer_get_id("City")
						var lpID = layer_get_id("Lightpoles")
						var roadID = layer_get_id("Road")
						
						var _starsID = layer_background_get_id(starsID)
						var _skyID = layer_background_get_id(skyID)
						var _cityID = layer_background_get_id(cityID)
						var _lpID = layer_background_get_id(lpID)
						var _roadID = layer_background_get_id(roadID)
						
						layer_background_alpha(_starsID, 0)
						layer_background_alpha(_skyID, 1)
						layer_background_alpha(_cityID, 1)
						layer_background_alpha(_lpID, 1)
						layer_background_alpha(_roadID, 1)
						
						layer_y(skyID, 0)
						layer_y(cityID, 0)
						layer_y(roadID, -180)
						layer_y(lpID, 0)
						
						player.visible = false
						
						var centerX = display_get_gui_width()/2 - 200
						var centerY = 256
						//instance_create_layer(centerX,centerY, "Instances", fakevan)
						
						fallingStage = 4
						fallingTimer = 120
						
						if instance_exists(fakevan) fakevan.visible = true
					}
					
				}
					
				//	Pepe van final shot
				else if fallingStage == 4 {
					
					fallingTimer--
					if fallingTimer > 0 fallRadius++
					
					if fallingTimer <= 0 {
						
						if fallingTimer == 0 y = -100
						
						//	Not done
						if !done {
							visible = true
							x = display_get_gui_width()/2 - 100
						
							y += 10
						
							if y >= fakevan.y {
								fakevan.explode = true
								fakevan.image_index = 0
									
								done = true
								
								y = fakevan.y + 180
								
								var skyID = layer_get_id("Sky")
								var cityID = layer_get_id("City")
								var lpID = layer_get_id("Lightpoles")
								var roadID = layer_get_id("Road")
								
								layer_hspeed(skyID, 0)
								layer_hspeed(cityID, 0)
								layer_hspeed(lpID, 0)
								layer_hspeed(roadID, 0)
								
							}
						} 
						//	Done
						else {
							sprite_index = s_sergey_run
							image_speed = 1.5
							image_angle = 0
							image_xscale = 1
							x += 5
							
							if x > display_get_gui_width() + 100 {
								gui.showEnd = true	
							}
						}
						
					}
					
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
		if spawner.lossState == -1 spawner.lossState = 0
	}
	
}