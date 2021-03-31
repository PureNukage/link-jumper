//if live_call() return live_result

if !broken and camera.nodeControl and point_in_rectangle(mouse_x,mouse_y, bbox_left,bbox_top, bbox_right,bbox_bottom) {
	draw_sprite(s_chainlink_big_outline,0,x,y)
	
	if connected > -1 and input.leftPress and gui.tankSelected == -1 {
		var Index = ds_list_find_index(connected.list, id)
		while ds_list_size(connected.list) > Index {
			var deleted = connected.list[| ds_list_size(connected.list)-1]
			ds_list_delete(connected.list, ds_list_size(connected.list)-1)
			if deleted != id deleted.connected = -1
		}
		connected = -1
	}
}

draw_self()

//draw_set_color(c_red)
//draw_set_alpha(0.5)
//var widthExtra = 120
//var heightExtra = 120
//if connected > -1 draw_rectangle(bbox_left-widthExtra,bbox_top-heightExtra, bbox_right+widthExtra,bbox_bottom+heightExtra, true)