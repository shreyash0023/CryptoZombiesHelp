/*      
        ********************************
        Visibility Functions in Solidity
        ********************************

        internal : internal is like private but it also acccessible to contracts that inherit from the contract containing the private function

        external : external are similar to public, except these function can only be called outosde the contract - they cannot be called by other function inside that contract 

        In solidity you can return more than one value from a function

*/


/*
        *********
        Interface 
        *********

        for our contract to talk to another contract on blockchain that we don't own, first we need to define an interface

        By including this interface in our dapp's code our contract knows what the other contract's functions look like, how to call them, and what sort of response to expect. 


*/



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

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
