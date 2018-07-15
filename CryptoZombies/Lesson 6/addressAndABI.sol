/*
	Contract Address:
	After you deploy your contract, it gets a fixed address on Ethereum where it will live forever. If you recall from Lesson 2, the address of the CryptoKitties contract on Ethereum mainnet is 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d.

	You'll need to copy this address after deploying in order to talk to your smart contract.

*/


/*

	ABI:
	ABI stands for Application Binary Interface. Basically it's a representation of your contracts' methods in JSON format that tells Web3.js how to format function calls in a way your contract will understand.

	When you compile your contract to deploy to Ethereum (which we'll cover in Lesson 7), the Solidity compiler will give you the ABI, so you'll need to copy and save this in addition to the contract address.

*/

// inititate web3 with contract address and abi

var myContract = new web3js.eth.Contract(myABI,myContractAddress);