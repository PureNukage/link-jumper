if camera.nodeControl and point_in_rectangle(mouse_x,mouse_y, bbox_left,bbox_top,bbox_right,bbox_bottom) {
	draw_sprite_ext(s_tank_outline,0, x,y,image_xscale,image_yscale,image_angle,c_white,1)
	if input.leftPress and !receiver {
		if gui.tankSelected == -1 {
			gui.tankSelected = id
			selected = true
		}
		else if gui.tankSelected == id {
			gui.tankSelected = -1
			selected = false
		}
	}
	else if input.leftPress and receiver and gui.tankSelected == -1 and connected > -1 and !input.rightReleased {
		var Index = ds_list_find_index(connected.list, id)
		while ds_list_size(connected.list) > Index {
			connected.list[| ds_list_size(connected.list)-1].connected = -1
			ds_list_delete(connected.list, ds_list_size(connected.list)-1)
		}
		connected = -1
	}
}

if selected draw_sprite_ext(s_tank_outline,0, x,y,image_xscale,image_yscale,image_angle,c_white,1)

draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,color,1)

if ds_list_size(list) > 1 {
	for(var i=0;i<ds_list_size(list)-1;i++) {
		var ID1 = list[| i]
		var ID2 = list[| i+1]
		var x1 = ID1.x
		var y1 = ID1.y
		var x2 = ID2.x
		var y2 = ID2.y
		if ID1.object_index == tank {
			x1 = ID1.x + (90*ID1.image_xscale)
			y1 = ID1.y + 64
		}
		if ID2.object_index == tank {
			x2 = ID2.x + (90*ID2.image_xscale)
			y2 = ID2.y + 64
		}
		draw_set_color(color)
		draw_line_width(x1,y1, x2,y2, 4)
	}
}

//draw_set_color(c_red)
//var widthExtra = 128
//var heightExtra = 32
//draw_rectangle(bbox_left-widthExtra,bbox_top-heightExtra, bbox_right+widthExtra,bbox_bottom+heightExtra, false)