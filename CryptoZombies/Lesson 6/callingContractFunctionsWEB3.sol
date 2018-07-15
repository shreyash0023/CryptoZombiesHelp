/*
	CALL:
	
	call is used for view and pure functions. It only runs on the local node and will not create transactions on the blockchain.

	// view and pure functions do not change states (no transcation)

	using web3js you would call a function named myMethod with the parameter 123 ->

	myContract.methods.myMethod(123).call();

		myContract is the initiation varible which needed ABI and contract address
		methods to call functions 
		and then the method name with parameters
	

*/

/*

	SEND:

	send will create a transaction and change data on the blockchain. You will need to send for function which are not view or pure 

	** NOTE ->Note: sending a transaction will require the user to pay gas, and will pop up their Metamask to prompt them to sign a transaction. When we use Metamask as our web3 provider, this all happens automatically when we call send(), and we don't need to do anything special in our code. Pretty cool!

	using web3js you would call a function named myMethod with the parameter 123 ->

	myContract.methods.myMethod(123).send();

		myContract is the initiation varible which needed ABI and contract address
		methods to call functions 
		and then the method name with parameters


	There are ae few major differences from the call function:-
	1. send transaction requires a from address of who is calling the function(msg.sender)
	2. sending transcation costs gas
	3. delay in effect on the blockchain

*/




	
	
	/*
		Here's how we would write a JavaScript function in our front-end that would take a zombie id, query our contract for that zombie, and return the result:
	*/

	/*
		 ** AUTOMATIC GETTER FUNCTION FOR public data types **

		In Solidity, when you declare a variable public, it automatically creates a public "getter" function with the same name. So if you wanted to look up the zombie with id 15, you would call it as if it were a function: zombies(15)

	*/



function getZombieDetails(id) {
  return cryptoZombies.methods.zombies(id).call()  // returns a zombie with index 'id' from a our contract (a web3js call) ** returns Zombie[] zombies where zombies is an array of struct 
}

// Call the function and do something with the result:
getZombieDetails(15)
.then(function(result) {
  console.log("Zombie 15: " + JSON.stringify(result));
});














function getZombieIdDetails(id)
{
	return myContract.method.zombies(id).call();
}




















