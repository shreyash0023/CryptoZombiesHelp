 /*
        A storage variable can be used in a function to affect the contract's state. 
    */

    /*
		A link to understand storage better 
		
		https://medium.com/loom-network/ethereum-solidity-memory-vs-storage-how-to-initialize-an-array-inside-a-struct-184baf6aa2eb
    */

pragma solidity ^0.4.19;

contract C{


	uint[20] public x;


	funtion f() public 
	{
		h(x); // x is passed in function h 
		g(x);	// x is passed in function g

	}

	function h(uint[20] z) pure internal // here x is passed as z, and z is not specified as storage. Therefore, the state variable x remains unmodified after execution
	{
		z[2] = 5; 

	}

	function g(uint[20] storage y) internal // here y is specified as storage. Therefore, it will alter the state of variable x after function execution.
	{	

		y[2] = 5;

	}

}