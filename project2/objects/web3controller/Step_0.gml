switch(state) {
	
	//	Let's check if the browser has metamask
	case 0:
		
		browser_has_metamask = checkMetaConnection()
		
		if browser_has_metamask {
			debug.log("MetaMask is installed in the browser!")
			state = 1
		}
		else {
			debug.log("User needs to install the MetaMask extension")	
		}
		
	break
	
	//	Connect wallet
	case 1:
		
		getMetamaskAccount()
		
	break
	
	//	Check the users address for the balance of the games NFT
	case 2:
		
		if user_address != "0" and !token_balance_check {
			debug.log("Checking users address for the balance of the games NFT")
			getTokenBalance(user_address, token_address, token_id)
			token_balance_check = true
		}
		
	break
	
	//	The user has an NFT! Proceed to Chapter 3
	case 3:
	
		if stage != 4 and !app.chapter3active {
			app.unlockedChapter3 = true
			gui.showMenuChapter3 = false
			app.switch_room(Room2)
			app.switch_stage(4)
			app.chapter3active = true
			state = -1
		}
	
	break
	
}