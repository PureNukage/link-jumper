onGround = false
ground = player.ground + sprite_get_height(player.sprite_index) - 160
grav = 0.4
vspd = 0
hspd = 0
Speed = 5
if app.stage == 1 Speed = irandom_range(3,5)
sprite_index = choose(s_fud,s_700k,s_shadowfork,s_duck)
sparkle = false
colorIndex = -1
colorNextIndex = -1
colorColor = c_white
colorLerp = -1

colors = []
colors[0][0] = make_color_rgb(236,19,255) // Purple
colors[1][0] = make_color_rgb(31,42,254) // Blue
colors[2][0] = make_color_rgb(0,240,253) // Teal
colors[3][0] = make_color_rgb(85,253,42) // Green
colors[4][0] = make_color_rgb(239,254,54) // Yellow
colors[5][0] = make_color_rgb(253,9,0) // Red

colors[0][1] = false // Purple
colors[1][1] = false // Blue
colors[2][1] = false // Teal
colors[3][1] = false // Green
colors[4][1] = false // Yellow
colors[5][1] = false // Red

function sparkleColorsReset() {
	for(var i=0;i<6;i++) {
		colors[i][1] = false
	}
}

function sparkleMergeDone() {
	var list = ds_list_create()
	for(var i=0;i<6;i++) {
		list[| i] = i
	}
			
	var index = -1
	while (index == -1) {
		if ds_list_size(list) > 1 {
			var randomIndex = irandom_range(0,ds_list_size(list)-1)
		} else if ds_list_size(list) == 1 var randomIndex = 0
		else {
			//	We went through the entire list of colors!
			sparkleColorsReset()
			for(var i=0;i<6;i++) {
				list[| i] = i
			}
		}
		
		var packedIndex = list[| randomIndex]
		if colors[packedIndex][1] == true {
			ds_list_delete(list, randomIndex)
		}
		else {
			index = randomIndex
		}
	}
	
	colors[colorNextIndex][1] = true
	colorIndex = colorNextIndex
	colorNextIndex = index
	
	
}
	
colorIndex = irandom_range(0,array_length(colors)-1)
colorColor = colors[colorIndex][0]
colorNextIndex = irandom_range(0,array_length(colors)-1)
colorLerp = 0