width = 960
height = 540
window_scale = 2
centerWindow = false

#region Enabling Use of Views

	view_enabled = true
	view_visible[0] = true

	view_set_visible(0,true)

	view_set_wport(0,width)
	view_set_hport(0,height)

#endregion
#region Resize and Center Game Window

	window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
	
	surface_resize(application_surface,view_wport[0],view_hport[0])
	
	display_set_gui_size(width,height)


#endregion
#region Camera Create

	Camera = camera_create()

	var viewmat = matrix_build_lookat(width,height,-10,width,height,0,0,1,0)
	var projmat = matrix_build_projection_ortho(width,height,1.0,32000.0)

	camera_set_view_mat(Camera,viewmat)
	camera_set_proj_mat(Camera,projmat)
	
	camera_set_view_pos(Camera,x,y)
	camera_set_view_size(Camera,width,height)
	
	camera_set_view_speed(Camera,200,200)
	camera_set_view_border(Camera,width,height)
	
	camera_set_view_target(Camera,id)

	view_camera[0] = Camera
	
#endregion

zoom_level = 1
default_zoom_width = camera_get_view_width(Camera)
default_zoom_height = camera_get_view_height(Camera)

function scale_canvas(new_width, new_height, center) {
	
	window_set_size(new_width, new_height)
	
	if center {
		centerWindow = true
	}
	
	surface_resize(application_surface,new_width,new_height)
	
}

scale_canvas(1920, 1080, true)