if rectangle_in_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom, 
camera_get_view_x(camera.Camera),camera_get_view_y(camera.Camera),
camera_get_view_x(camera.Camera)+camera_get_view_width(camera.Camera),
camera_get_view_y(camera.Camera)+camera_get_view_height(camera.Camera)) {
	app.chapter3_seen_timer = true	
}