if instance_exists(player) and app.stage == 2 {
	x = player.x
	y = player.y
}
else if instance_exists(sergey) and app.stage == 4 {
	x = sergey.x
	y = sergey.y	
}

if cameraRefresh {
	cameraFix()
	cameraRefresh = false
}

if centerWindow = true {
	window_center()
	centerWindow = false
}

if os_browser != browser_not_a_browser {
	if (browser_width != window_get_width() or browser_width != window_get_height()) {
		scale_canvas(browser_width, browser_height, true)	
	}
}

////	Camera
camera_set_view_pos(Camera,
		clamp( camera_get_view_x(Camera), 0, room_width - camera_get_view_width(Camera) ),
		clamp( camera_get_view_y(Camera), 0, room_height - camera_get_view_height(Camera) ));

var view_w = camera_get_view_width(Camera)
var view_h = camera_get_view_height(Camera)

var rate = 0.2

var new_w = round(lerp(view_w, zoom_level *  default_zoom_width, rate))
var new_h = round(lerp(view_h, zoom_level * default_zoom_height, rate))
			
if new_w & 1 {
	new_w++	
}
if new_h & 1 {
	new_h++	
}

camera_set_view_size(Camera, new_w, new_h)

//	Realignment
var shift_x = camera_get_view_x(Camera) - (new_w - view_w) * 0.5
var shift_y = camera_get_view_y(Camera) - (new_h - view_h) * 0.5

camera_set_view_pos(Camera,shift_x, shift_y)


////	Clamp app x,y within room
var edgeX = camera_get_view_width(Camera)/2
var edgeY = camera_get_view_height(Camera)/2
x = clamp(x,0+edgeX,room_width-edgeX)
y = clamp(y,0+edgeY,room_height-edgeY)

////	If cameraZone is set, clamp within those
//if app.stage == 4 and sergey.cameraZone > -1 {
//	var ID = sergey.cameraZone
//	x = clamp(x, ID.bbox_left, ID.bbox_right)	
//	y = clamp(y, ID.bbox_top, ID.bbox_bottom)
//}