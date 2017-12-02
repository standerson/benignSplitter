pragma solidity ^0.4.8;

// A contract that is desinged for the owner 2 get rich one wei at a time
// 
import '/SafeMath.sol';

contract Splitter {


	
	public bool isActive;
	mapping (address => uint256) balances;

	modifier onlyActive () {
		require (isActive);
		_;
	}

	function Splitter() {
		owner = msg.sender;
		Activate(block.timestamp, msg.sender);
	}

	function onlyActive splitFunds(address _recipient1, address _recipient2) payable {
		balances[_recipient1] += balances[_recipient1];
		balances[_recipient2] += balances[_recipient2];
		Split(_recipient1, _recipient2, msg.value);
	}

	
	function withdrawAll (address _recipient) {  
	    require( balances[_recipient] > 0);
	    uint value	= balances[_recipient]
	    balances[_recipient] = 0;
	    _recipient.transfer(value);
	    WithdrawAll(_recipient, value);
	    
	}

	function Deactivate() {
		require (msg.sender == owner) ;
		isActive = false;
		Deactivated(block.timestamp, msg.sender);
	}

	function Activate() {
		require(msg.sender == owner) ;
		isActive = true;
		Activated(block.timestamp, msg.sender)
		
	}
	
	event Activated(uint indexed _time, address _actor);
	event Deactivated(uint indexed _time, address _actor);
	event Split(address _recipient1, address _recipient2, uint _value);
	event WithdrawAll(address _recipient, uint _value);
	
}
