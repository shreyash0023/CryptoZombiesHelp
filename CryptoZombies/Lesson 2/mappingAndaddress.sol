pragma solidity ^0.4.19;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    // declare mappings here
    mapping (uint => address) public zombieToOwner;
     // How many zombies the owner has (key = uint)



    mapping (address => uint) ownerZombieCount;
    // Addresses that own a zombie (key = address)





    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1; // array.push() returns the new length of the array 

        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        NewZombie(id, _name, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    /*
		Addresses:
		The Ethereum blockchain is madeup of accounts, like bank accounts. Each account has a balance of Ether. 

		Each account has an address. example - '0x0cE446255506E92DF41614C46F1d6df9Cc969183'

		We'll get into the nitty gritty of addresses in a later lesson, but for now you only need to understand that an address is owned by a specific user (or a smart contract).

		So we can use it as a unique ID for ownership of our zombies. When a user creates new zombies by interacting with our app, we'll set ownership of those zombies to the Ethereum address that called the function.


	*/


	/*	
		Mappings:

		Mapping is another way of storing organized data on solidity. 

	*/

	// For a financial app, storing a uint that holds the user's account balance:
	mapping (address => uint) public accountBalance;


	// Or could be used to store / lookup usernames based on userId
	mapping (uint => string) userIdToName;

	/*
	******************
	msg.sender
	***

	In solidity, there are certain global variables that are available to all functions.

	msg.sender refers to the address of the person (or smartcontract) who called the current function
	 
	*/


}