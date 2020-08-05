version = "0.0.1"
creator = "@PureNukage"

stage = -1

var heavenCollisionID = layer_get_id("HeavenCollision")
instance_deactivate_layer(heavenCollisionID)

//room_width = 960

var Layer = "Instances"
instance_create_layer(0,0,Layer,time)
instance_create_layer(0,0,Layer,input)
instance_create_layer(0,0,Layer,debug)
instance_create_layer(0,0,Layer,camera)
instance_create_layer(0,0,Layer,gui)

function switch_stage(index) {
	
	var heavensWorldID = layer_get_id("Heavens_world")
	var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
	var heavensCloudsID = layer_get_id("Heavens_clouds")
	var roadID = layer_get_id("Road")
	var lightpolesID = layer_get_id("Lightpoles")
	var cityID = layer_get_id("City")
	var skyID = layer_get_id("Sky")
	
	var _heavensWorldID = layer_background_get_id(heavensWorldID)
	var _heavensClouds = layer_background_get_id(heavensCloudsID)
	var _heavensFrontPillarID = layer_background_get_id(heavensFrontPillarID)
	var _skyID = layer_background_get_id(skyID)
	
	switch(index) 
	{
		case 0:
			app.stage = 0
		
			player.visible = true
			
			spawner.visible = true
			
			with spawner instance_destroy()
			
			time.stream = 0
			
			var Spawner = instance_create_layer(768,256,"Instances",spawner)
			Spawner.visible = true
			
			gui.showMenu = false
			gui.showArrows = true
			gui.arrowTimer = 90
			
			if !instance_exists(sound) instance_create_layer(0,0,"Instances",sound)
			
		break;
		case 1:
			app.stage = 1
			player.image_angle = 0
			spawner.spawnTimer = 0
			spawner.sprite_index = s_chopper
			if instance_exists(obstacle) with obstacle instance_destroy()
			layer_hspeed(roadID,0)
			layer_hspeed(lightpolesID,0)
			layer_hspeed(cityID,0)
			layer_hspeed(skyID,0)
			
			layer_y(roadID, -190)
			layer_y(lightpolesID, -100)
			layer_y(cityID, 0)
			layer_y(skyID, 0)
			if player.x > display_get_gui_width() player.x = 100
			camera.x = 0
			player.y = player.ground - 40
			player.mask_index = s_sergey_idle
			if player.damaged player.damaged = false
			
			var _heavensWorldID = layer_background_get_id(heavensWorldID)
			var _heavensClouds = layer_background_get_id(heavensCloudsID)
			var _heavensFrontPillarID = layer_background_get_id(heavensFrontPillarID)
			var _skyID = layer_background_get_id(skyID)
			
			layer_background_alpha(_heavensWorldID, 0)
			layer_background_alpha(_heavensClouds, 0)
			layer_background_alpha(_heavensFrontPillarID, 0)
			
			layer_background_alpha(_skyID, 1)
			
			
		break
		case 2:
			app.stage = 2
			player.image_angle = 0
			layer_y(heavensWorldID,0)
			layer_y(heavensFrontPillarID,0)
			
			player.image_speed = 1
			if player.damaged player.damaged = false
			
			if instance_exists(obstacle) with obstacle instance_destroy()
			
			spawner.sprite_index = -1
			
			player.mask_index = s_collision
			
			var heavensCollisionID = layer_get_id("HeavenCollision")
			instance_activate_layer(heavensCollisionID)
			
			var roadID = layer_get_id("Road")
			var lightpolesID = layer_get_id("Lightpoles")
			var cityID = layer_get_id("City")
			var skyID = layer_get_id("Sky")
			var starsID = layer_get_id("Stars")
			var _skyID = layer_background_get_id(skyID)
			var _roadID = layer_background_get_id(roadID)
			var _lightpolesID = layer_background_get_id(lightpolesID)
			var _cityID = layer_background_get_id(cityID)
			var _starsID = layer_background_get_id(starsID)
			
			layer_background_alpha(_skyID, 0)
			layer_background_alpha(_starsID, 0)
			
			var _heavensWorldID = layer_background_get_id(heavensWorldID)
			var _heavensClouds = layer_background_get_id(heavensCloudsID)
			var _heavensFrontPillarID = layer_background_get_id(heavensFrontPillarID)
			
			layer_background_alpha(_heavensWorldID, 1)
			layer_background_alpha(_heavensClouds, 1)
			layer_background_alpha(_heavensFrontPillarID, 1)
			
			layer_y(roadID, 5000)
			layer_y(cityID, 5000)
			layer_y(lightpolesID, 5000)
			layer_y(heavensWorldID, 0)
			layer_y(heavensFrontPillarID, 0)
			
		break
		case 3:
		
			app.stage = 3
			
			player.image_angle = 180
			
			player.vspd = 20
			player.y = 100
			
			player.mask_index = s_sergey_flying
			
			var starsID = layer_get_id("Stars")
			var _starsID = layer_background_get_id(starsID)
			var _heavensWorldID = layer_background_get_id(heavensWorldID)
			var _heavensClouds = layer_background_get_id(heavensCloudsID)
			var _heavensFrontPillarID = layer_background_get_id(heavensFrontPillarID)
			var _skyID = layer_background_get_id(skyID)
			
			layer_background_alpha(_heavensWorldID, 0)
			layer_background_alpha(_heavensFrontPillarID, 0)
			layer_background_alpha(_skyID, 0)
			
			//layer_background_alpha(_starsID, 0.5)
			
			
		break
	}
	
	
}