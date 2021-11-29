interaction = false

moveX = 0
opened = false
opening = false
function _open() {
	x -= 2
	moveX += 2
	var collisionUnderMe = instance_position(bbox_right-32,bbox_bottom-32,collision)
	if collisionUnderMe > -1 {
		collisionUnderMe.x -= 2
	}
	if moveX >= 130 {
		opening = false
		layer_depth("Tiles_3", -500)
	}
	if sergey.y < bbox_bottom depth = -2000
}