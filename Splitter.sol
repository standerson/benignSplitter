pragma solidity ^0.4.8;

contract Splitter {

	address[] public recipients;
	address owner;

	function Splitter() {
		owner = msg.sender;  
	}

	function splitFunds(address[] _recipients) payable {
		
		recipients = _recipients;

		uint numRecipeints = recipients.length;
		uint splitAmount = msg.value / numRecipeints;

		for (uint i=0; i<numRecipeints; i++){
			recipients[i].transfer(splitAmount); 
		}
	}

	function destroy() {
		if (msg.sender == owner) {
			selfdestruct(owner);
		}
	}
}
