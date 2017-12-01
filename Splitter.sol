pragma solidity ^0.4.8;

contract Splitter {

	address owner;
	bool isActive = true;

	modifier onlyActive () {
		require (isActive == true);
		_;
	}
	function Splitter() public {

		owner = msg.sender;  
	}

	function  splitFunds(address[] _recipients) payable onlyActive public {

		uint numRecipients = _recipients.length;
		uint splitAmount = msg.value / numRecipients;
		uint remainder = msg.value - (splitAmount * numRecipients);
		
		
		if(msg.gas<(numRecipients*21000)||numRecipients<2){
			revert();
		}
		
		for (uint i=0; i<numRecipients; i++){
			if (i == numRecipients - 1){
				splitAmount += remainder; 
			}
			if(!_recipients[i].send(splitAmount)){
					revert();
				} 
		}
		
		
	}

	function destroy() public {
		if (msg.sender == owner) {
			isActive = false;
		}
	}

	function resurrect() public {
		if (msg.sender == owner) {
			isActive = true;
		}
	}
	
	
}
