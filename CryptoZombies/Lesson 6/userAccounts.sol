/*
	Obviously we'd first need to use our function getZombiesByOwner(owner) to look up all the IDs of zombies the current user owns.

	But our Solidity contract is expecting owner to be a Solidity address. How can we know the address of the user using our app?
*/


// METAMASK allows the user to manage multiple accounts in their extension 

// we can see which account is active on injected web3 variable

	var userAccount = web3.eth.accounts[0]

/*
	Because the user can switch the active account at any time in MetaMask, our app needs to monitor this variable to see if it has changed and update the UI accordingly. For example, if the user's homepage displays their zombie army, when they change their account in MetaMask, we'll want to update the page to show the zombie army for the new account they've selected.

	We can do that with a setInterval loop as follows:

*/
	
		var accountInterval = setInterval(function() {
  // Check if account has changed
  	if (web3.eth.accounts[0] !== userAccount) {
    userAccount = web3.eth.accounts[0];
    // Call some function to update the UI with the new account
    updateInterface();
  }
}, 100);











