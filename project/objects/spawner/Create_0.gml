spawn_time = 30
spawn_time_current = 0

history = []

obstacles = ds_list_create()

obstacles[| 0] = s_fud
obstacles[| 1] = s_chainlink

obstacles_total = ds_list_size(obstacles)