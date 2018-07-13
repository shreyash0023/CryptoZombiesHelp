pragma solidity ^0.4.19;

/*
	only functions with payable modifiers can recieve ether 

	msg.value is the amount of money being sent to the contract

*/


/*
	to withdraw ether stored in contract's Ethereum account 


*/

contract GetPaid is Ownable {
  function withdraw() external onlyOwner {
    owner.transfer(this.balance); // will return the total balance stored in that contract
  }
}

/*

	contract Ownable{

	address public owner;

 	event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

 	 function Ownable() public {
    owner = msg.sender;
  	}

	modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  	}
	

	function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  	}
}















*/