/*
	In order to filter events and only listen for changes related to the current user, our Solidity contract would have to use the indexed keyword, like we did in the Transfer event of our ERC721 implementation:
	
*/

event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);

/*
	In this case, because _from and _to are indexed, that means we can filter for them in our event listener in our front end:
	
*/


// Use `filter` to only fire this code when `_to` equals `userAccount`
cryptoZombies.events.Transfer({ filter: { _to: userAccount } })
.on("data", function(event) {
  let data = event.returnValues;
  // The current user just received a zombie!
  // Do something here to update the UI to show it
}).on("error", console.error);