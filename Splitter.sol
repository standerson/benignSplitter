pragma solidity ^0.4.8;

contract Splitter {

	address owner;
	
	function Splitter() {
		owner = msg.sender;  
	}

	function splitFunds(address[] _recipients) payable {

		uint numRecipeints = recipients.length;
		uint splitAmount = msg.value / numRecipients;
		
		if(msg.gas<(numRecipients*21000)){
			throw;
		}
		
		for (uint i=0; i<numRecipients; i++){
			recipients[i].transfer(splitAmount); 
		}
		
		
	}

	function destroy() {
		if (msg.sender == owner) {
			selfdestruct(owner);
		}
	}
	
	
}
