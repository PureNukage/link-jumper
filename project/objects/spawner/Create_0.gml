spawn = ds_queue_create()
spawn_time = ds_queue_create()
stage0()

obstacles = ds_list_create()

obstacles[| obstacle_type.fud] = s_fud
obstacles[| obstacle_type.link] = s_chainlink

obstacles_total = ds_list_size(obstacles)