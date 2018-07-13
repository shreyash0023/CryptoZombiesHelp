/*

	Lesson 1
	 	1.Our factory will maintain a database of all zombies in our army

	 	2.Our factory will have a function for creating new zombies

	 	3.Each zombie will have a random and unique appearance

	State variables 

	State variables are permanently stored in contract storage. This means they're written to the Ethereum blockchain. Think of them like writing to a DB.

	Solidity also supports an exponential operator (i.e. "x to the power of y", x^y):

	uint x = 5 ** 2; // equal to 5^2 = 25

	*************
	*Structs 
	*******
	
	Sometimes we need a more complex data type

	struct Person
	{
		uint age;
		string name;

	}



	*************
	*Arrays
	*******

	uint[2] fixedArray;

	string[5] fixedString; -> contains 5 strings 
	
	uint[] dynamicArray; -> it can keep growing


	PUBLIC ARRAYS
	
	You can declare an array as public, and Solidity will automatically create a getter method for it. The syntax looks like:

	// Person[] public people;

	Person[] public people;
	Other contracts would then be able to read (but not write) to this array. So this is a useful pattern for storing public data in your contract.


	Creating new struct objects 

	Now we're going to learn how to create new Persons and add them to our people array.

// create a New Person:
Person satoshi = Person(172, "Satoshi");

// Add that person to the Array:
people.push(satoshi);















*/