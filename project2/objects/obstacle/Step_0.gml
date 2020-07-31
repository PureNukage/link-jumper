switch(app.stage) 
{
	case 0:
		x -= Speed

		//	In the air
		if !onGround {
	
			y += vspd
			vspd += grav
	
			//	Check for landing on the ground
			if y >= ground {
				y = ground
				onGround = true
			}
		}
	
	break
	case 1:
		
		y += Speed
		
		if sparkle {
			
			var Lerp = 0.2
			colorLerp = lerp(colorLerp,1,Lerp)
		
			var color1 = colors[colorIndex][0] 
			var color2 = colors[colorNextIndex][0]
			colorColor = merge_color(color1,color2,colorLerp)
		
			if colorLerp >= 0.98 {
				sparkleMergeDone()
				colorLerp = 0
			}
			
		}
		
	break
}