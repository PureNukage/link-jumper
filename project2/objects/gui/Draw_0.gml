if showNodeControls {
	
	if tankSelected > -1 {
		
		draw_set_color(tankSelected.color)
		var _x = tankSelected.x + (64 * image_xscale)
		var _y = tankSelected.y + 64
		if ds_list_size(tankSelected.list) > 1 {
			_x = tankSelected.list[| ds_list_size(tankSelected.list)-1].x
			_y = tankSelected.list[| ds_list_size(tankSelected.list)-1].y
		}
		draw_line_width(_x,_y, mouse_x,mouse_y, 4)
		
		var ID = instance_position(mouse_x,mouse_y, chainlink_big)
		if ID > -1 and !ID.broken {
			var lastConnectedID = tankSelected.list[| ds_list_size(tankSelected.list)-1]
			var extraWidth = 128
			var extraHeight = 32
			if lastConnectedID.object_index == chainlink_big {
				extraWidth = 80
				extraHeight = 64
			}
			if input.leftPress and ID.connected == -1 and rectangle_in_rectangle(lastConnectedID.bbox_left-extraWidth,lastConnectedID.bbox_top-extraHeight,lastConnectedID.bbox_right+extraWidth,lastConnectedID.bbox_bottom+extraHeight,
			ID.bbox_left,ID.bbox_top,ID.bbox_right,ID.bbox_bottom) > 0 {
				ds_list_add(tankSelected.list,  ID)
				ID.connected = tankSelected
			}
		}
		var ID = instance_position(mouse_x,mouse_y, tank)
		if ID > -1 and ID.receiver {
			var lastConnectedID = tankSelected.list[| ds_list_size(tankSelected.list)-1]
			var extraWidth = 128
			var extraHeight = 32
			if lastConnectedID.object_index == chainlink_big {
				extraWidth = 120
				extraHeight = 120
			}
			if input.leftPress and ID.connected == -1 and rectangle_in_rectangle(lastConnectedID.bbox_left-extraWidth,lastConnectedID.bbox_top-extraHeight,lastConnectedID.bbox_right+extraWidth,lastConnectedID.bbox_bottom+extraHeight,
			ID.bbox_left,ID.bbox_top,ID.bbox_right,ID.bbox_bottom) > 0 {
				ds_list_add(tankSelected.list,  ID)
				ID.connected = tankSelected
				input.rightReleased = true
			}
		}
		
		if input.rightReleased {
			tankSelected.selected = false
			tankSelected = -1
		}
		
	}
	
}