
<script>
	
	var cryptoZombies;

	function startApp()
	{	
		var cryptoZombiesAddress = "YOUR_CONTRACT_ADDRESS";
		cryptoZombies = new web3js.eth.Contract(cryptoZombiesABI,cryptoZombiesAddress); // requires ABI and contract address


	}	

	function getZombieDetails(id)
	{
		return cryptoZombies.methods.zombies(id).call() // calling the zombies struct array with id index 
		// Zombie[] public zombies; -> public data types have inbuilt getter function 


	}

	/*
		Function for zombieToOwner in Zombiefactory.sol

	*/

	function zombieToOwner(id)
	{
		return cryptozombies.methods.zombieToOwner(id).call() // methods to get address with id from the mapping
		// mapping (uint => address) public zombieToOwner;
	}

	/*
		getZombiesByOwner
	*/

	function getZombiesByOwner(owner)
	{
		return cryptozombies.methods.getZombiesByOwner(owner).call()

	}

















</script?