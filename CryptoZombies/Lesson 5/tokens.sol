/*
	A token on Ethereum is basically just a smart contract that follows some common rules — namely it implements a standard set of functions that all other token contracts share, such as transfer(address _to, uint256 _value) and balanceOf(address _owner).

	Internally the smart contract usually has a mapping, mapping(address => uint256) balances, that keeps track of how much balance each address has.

	Since all ERC20 tokens share the same set of functions with the same names, they can all be interacted with in the same ways.

	There's another token standard that's a much better fit for crypto-collectibles like CryptoZombies — and they're called ERC721 tokens.

	ERC721 tokens are not interchangeable since each one is assumed to be unique, and are not divisible. You can only trade them in whole units, and each one has a unique ID. So these are a perfect fit for making our zombies tradeable.
*/

