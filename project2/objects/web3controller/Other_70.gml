var _id = async_load[? "id"]

if _id == "getWalletAddress" {
	user_address = async_load[? "address"]
	
	//	Got the users address
	if user_address != "0" {
		state = 2
		debug.log("Got the users address as: " + string(user_address))
	}
	//	Couldn't get users address
	else {
		debug.log("ERROR Got a 0 for the users address")
		state = -1
		get_metamaskaccount_check = false
		token_balance_check = false
	}
}

if _id == "getTokenBalance" {
	
	var balance = async_load[? "balance"]
	
	if balance != "-1" {
		user_has_nft = true
		state = 3
		debug.log("User holds: "+string(balance)+" of the games NFT!")
	}
	//	User does not hold any of the NFT!
	else {
		state = -1
		get_metamaskaccount_check = false
		token_balance_check = false
		user_has_nft = false
		debug.log("User does not hold any of the games NFT!")
	}
	
}