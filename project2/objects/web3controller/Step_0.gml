switch(state) {
	
	//	Let's check if the browser has metamask
	case 0:
		
		get_metamaskaccount_check = false
		token_balance_check = false
		
		if !ds_list_empty(gui.metamaskMessages) {
			ds_list_clear(gui.metamaskMessages)	
		}
		
		browser_has_metamask = checkMetaConnection()
		
		if browser_has_metamask {
			debug.log("MetaMask is installed in the browser!")
			state = 1
		}
		else {
			debug.log("User needs to install the MetaMask extension")
			gui.addMetamaskMessage("User needs to install the MetaMask extension")
			get_metamaskaccount_check = false
			token_balance_check = false
			state = -1
		}
		
	break
	
	//	Connect wallet
	case 1:
		
		if !get_metamaskaccount_check {
			getMetamaskAccount()
			get_metamaskaccount_check = true
		}
		
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
	
		if user_has_nft {
			debug.log("Proceeding to Chapter 3!")
			//app.unlockedChapter3 = true
			//gui.showMenuChapter3 = false
			//app.switch_room(Room2)
			//app.switch_stage(4)
			//app.chapter3active = true
			gui.showMenuChapter3 = false
			app.switch_stage(4)
			app.switch_room(Room2)
			state = -1
			get_metamaskaccount_check = false
			token_balance_check = false
		}
	
	break
	
}