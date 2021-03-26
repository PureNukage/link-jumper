version = "0.1.3"
creator = "@PureNukage"

//	cr_size_we - horizontal
//	cr_size_ns - vertical
//	cr_size_nwse - corner

stage = -1

chapter3_looped_once = false
chapter3_seen_timer = false

chapter3_timer = 4
chapter3_timer_paused = true

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
		
			camera.cameraRefresh = true
			
			app.stage = 0
		
			player.visible = true
			
			spawner.visible = true
			
			with spawner instance_destroy()
			
			time.stream = 0
			
			var Spawner = instance_create_layer(832,256,"Instances",spawner)
			Spawner.visible = true
			
			gui.showMenu = false
			gui.showArrows = true
			gui.arrowTimer = 90
			
			if !instance_exists(sound) instance_create_layer(0,0,"Instances",sound)
			
		break;
		case 1:
			app.stage = 1
			
			app.unlockedFlyingStage = true
			
			player.visible = true
			
			spawner.visible = true
			
			if !instance_exists(sound) instance_create_layer(0,0,"Instances",sound)
			
			//layer_y("Road", -181)
			
			if gui.showMenu gui.showMenu = false
			gui.showArrowsFlying = true
			gui.arrowTimer = 90
			
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
		case 4:
		
			app.stage = 4
			
			camera.cameraRefresh = true
			
			if !instance_exists(sound) instance_create_layer(0,0,"Instances",sound)
			
		break
	}
	
	save_game()
	
}
	
function save_game() {
	ini_open("save.ini")
	
	ini_write_real("Data", "unlockedFlying", unlockedFlyingStage)
	
	ini_close()
}

function load_game() {
	ini_open("save.ini")
	
	unlockedFlyingStage = ini_read_real("Data", "unlockedFlying", 0)
	
	ini_close()
}
	
roomSwitch = -1
roomSwitchStage = -1
roomSwitchTimer = 0
roomSwitchTimerMax = 90
function switch_room(index) {
	roomSwitch = index
	roomSwitchStage = 0
}
function _switch_room() {
	switch(roomSwitchStage) {
		//	Switching to the other room
		case 0:
			
			draw_set_alpha(roomSwitchTimer / roomSwitchTimerMax)
			draw_set_color(c_black)
			draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(), false)
			roomSwitchTimer++
			if roomSwitchTimer >= roomSwitchTimerMax {
				roomSwitchStage = 1
				roomSwitchTimer = roomSwitchTimerMax
			}
			draw_set_alpha(1)
			
		break
		//	Changing to the new room
		case 1:
			room_goto(roomSwitch)
			roomSwitchStage = 2
			camera.cameraRefresh = true
		break
		//	Fading from black to the new room
		case 2:
			
			//	Adjust Sergey depending on which room we're in
			if roomSwitchTimer == roomSwitchTimerMax {
				switch(room) {
					case Room2:
						sergey.x = 32
						sergey.y = 448
						sergey.depth = -1
					break
				}
			}
			
			draw_set_alpha(roomSwitchTimer / roomSwitchTimerMax)
			draw_set_color(c_black)
			draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(), false)
			roomSwitchTimer--
			if roomSwitchTimer <= 0 {
				roomSwitchStage = -1
				roomSwitchTimer = 0
				roomSwitch = -1
			}
			draw_set_alpha(1)
			
		break
	}
}
	
gameOver = false
gameOverTimer = 0
gameOverTimerMax = 180
function game_over() {
	draw_set_color(c_white)
	draw_set_alpha(gameOverTimer / gameOverTimerMax)
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false)
	gameOverTimer++
	//	Reset everything
	if gameOverTimer >= gameOverTimerMax {
		instance_destroy(time)
		instance_create_layer(0,0,"Instances",time)
		gameOver = false
		gameOverTimer = 0
		chapter3_timer = 4
		room_goto(Room2)
		camera.cameraRefresh = true
		chapter3_looped_once = true
	}
	draw_reset()
}

load_game()

if room == RoomApp {
	room_goto(room_next(room))
	if room_next(room) != Room1 {
		gui.showMenu = false
		switch_stage(4)
	}
	camera.cameraRefresh = true
}