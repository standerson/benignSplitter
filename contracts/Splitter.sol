pragma solidity ^0.4.8;

contract Splitter {

	
	public bool isActive = true;

	modifier onlyActive () {
		require (isActive);
		_;
	}
	function Splitter() {

		
	}

	function onlyActive splitFunds(address[] _recipients) payable {

		uint numRecipients = recipients.length;
		uint splitAmount = msg.value / numRecipients;
		uint remainder = msg.value - (splitAmount * numRecipients);
		
		
		if(msg.gas<(numRecipients*21000)||numRecipients<2){
			throw;
		}
		
		for (uint i=0; i<numRecipients; i++){
			if (i == numRecipients - 1){
				splitAmount += remainder; 
			}
			if(!recipients[i].transfer(splitAmount)){
				throw;
				} 
		}
		
	}

	function destroy() {
		if (msg.sender == owner) {
			isActive = false;
		}
	}

	function resurrect() {
		if (msg.sender == owner) {
			isActive = true;
		}
	}
	
	
}
