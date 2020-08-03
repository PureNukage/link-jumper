version = "0.0.1"
creator = "@PureNukage"

stage = 0

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
	
	switch(index) 
	{
		case 0:
			
		break;
		case 1:
			app.stage = 1
			spawner.spawnTimer = 0
			if instance_exists(obstacle) with obstacle instance_destroy()
			var roadID = layer_get_id("Road")
			var lightpolesID = layer_get_id("Lightpoles")
			var cityID = layer_get_id("City")
			var skyID = layer_get_id("Sky")
			layer_hspeed(roadID,0)
			layer_hspeed(lightpolesID,0)
			layer_hspeed(cityID,0)
			layer_hspeed(skyID,0)
		break
		case 2:
			app.stage = 2
			var heavensWorldID = layer_get_id("Heavens_world")
			var heavensFrontPillarID = layer_get_id("Heavens_frontpillar")
			layer_y(heavensWorldID,0)
			layer_y(heavensFrontPillarID,0)
			player.ground -= 40
			//player.y = player.ground
			
			//room_width = 2080
			player.image_speed = 1
			
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
			
			if layer_background_get_alpha(_skyID) > 0 {
				layer_background_alpha(_skyID, 0)
				layer_background_alpha(_starsID, 0)
				layer_y(roadID, 5000)
				layer_y(cityID, 5000)
				layer_y(lightpolesID, 5000)
			}
			
			
			
		break
	}
	
	
}