showRestart = false

showInteract = false

showArrows = false

showMessage = false
messageTimer = 0
text = ""

showEnd = false

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