pragma solidity ^0.4.19;

/*
    Require:
    require makes it so that the function will throw an error and stop executing if the condition is not true

    Note: Solidity does not have a native string comparision. So we comapre their keccak256(); hashes to see if the strings are equal

    require();
*/


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
        ownerZombieCount[msg.sender]++; // incrementing uint by 1
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        // start here
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

    /**
     * Contract ZombieFeeding inherits from ZombieFactory 
     */
    contract ZombieFeeding is ZombieFactory {
         
    }
    

    /*  Storage vs Memory 

        Storage refers to the variables stored permanantly on the blockchain.
        Memory variables are temporary and they are earsed between external function calls to your contract

        State variables, the ones declared outside outside of your function are by default storage while variables declared inside of your functiona are 'memory'


    */

    // There might be times when you need to explicitly name storage and memory when dealing with arrays and struts inside functions 


    /*
        A storage variable can be used ina function to affect the contract's state.
    */

    contract SandwichFactory {
  struct Sandwich {
    string name;
    string status;
  }

  Sandwich[] sandwiches; // array of structs named sandwiches

  function eatSandwich(uint _index) public {
    // Sandwich mySandwich = sandwiches[_index];

    // ^ Seems pretty straightforward, but solidity will give you a warning
    // telling you that you should explicitly declare `storage` or `memory` here.

    // So instead, you should declare with the `storage` keyword, like:

    Sandwich storage mySandwich = sandwiches[_index]; // assigning an index from a function                                          // to an instance of the struct 
                                                        

    // ...in which case `mySandwich` is a pointer to `sandwiches[_index]`
    // in storage, and...
    mySandwich.status = "Eaten!";
    // ...this will permanently change `sandwiches[_index]` on the blockchain.

    // If you just want a copy, you can use `memory`:
    Sandwich memory anotherSandwich = sandwiches[_index + 1];
    // ...in which case `anotherSandwich` will simply be a copy of the 
    // data in memory, and...
    anotherSandwich.status = "Eaten!";
    // ...will just modify the temporary variable and have no effect 
    // on `sandwiches[_index + 1]`. But you can do this:
    sandwiches[_index + 1] = anotherSandwich;
    // ...if you want to copy the changes back into blockchain storage.
  }
}








