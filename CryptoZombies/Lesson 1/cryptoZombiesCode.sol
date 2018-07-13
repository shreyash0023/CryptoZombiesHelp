pragma solidity ^0.4.19;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name,uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits; // 10^16

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies; // Public array

    function createZombie(string _name, uint _dna) {
        uint id = zombies.push(Zombie(_name, _dna));
        id--;
        NewZombie(id,_name,_dna);
    }

    /* In solidity functions are public by default 
        This means that anyone or any other contract can call your function and execute its code

        It is a convention to start private funtion names with an underscore
    */

    // Funtion return values 

    string greeting = "What is up dog"; // LOL

    function sayHello() public returns (string) 
    {
    return greeting;
    }

    // View function and Pure functions

    /*
        view function tags returns a value a do not consume any gas
        */

    function sayHello() public view returns (string) {
        return "HELLO";
    }
    /*
        Solidity also contains 'pure' functions, which means that you are not even accessing data in the app.
    */

    function _multiply(uint a, uint b) private pure returns (uint) {
    return a * b;
    }

    // Keccak256 and typecasting 
    /*
        
        Ethereum has the hash function keccak256 built in, which is a version of SHA3. A hash function basically maps an input string into a random 256-bit hexidecimal number. A slight change in the string will cause a large change in the hash.

    */

    function _generateRandomDna(string _str) private view returns (uint) {
        // start here

        uint rand = uint(keccak256(_str));
        return rand % dnaModulus; // The return dna should be under 15
    }

    //Putting it together 

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name); // Calling the _generateRandomDna() function to create a uint random dna (b/w 0-15) to subsequently create a zombie

        _createZombie(_name, randDna); // creating a zombie and pushing it into the zombies array (a public array)

    }

    // Events

    /*
        Events are a way for your contract to communicate that something happened on the blockchain to your app-front end, which can be 'listening' for certain events and take action when they happen
    */

    // declare the event
    event IntegersAdded(uint x, uint y, uint result);

    function add(uint _x, uint _y) public {
    uint result = _x + _y;
    // fire an event to let the app know the function was called:
    IntegersAdded(_x, _y, result);
    return result;
    }

    /*
        Your app front-end then could listen for the event. A javascript implementation would work something like this:

        YourContract.IntegersAdded(function(error, result) { 
        // do something with result
        }
    */



    // Ethereum has a javascript library called Web3.js
















}
