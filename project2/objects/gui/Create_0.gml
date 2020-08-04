showRestart = false

showInteract = false

showArrows = false
arrowTimer = 90

showMessage = false
messageTimer = 0
text = ""

showEnd = false

showMenu = true

function setMessage(String, timer) {
	
	text = String
	messageTimer = timer
	showMessage = true
	
}

function endMessage() {
	text = ""
	messageTimer = -1
	showMessage = false
}