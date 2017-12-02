var Splitter = artifacts.require("./Splitter.sol");

contract('Splitter', function(accounts) {
  it("should have some ether ", function() {
    var balance = web3.eth.getBalance(accounts[0]);
    assert.isAtLeast(balance, .00001, "accounts[0] doesn't have any ether. the balance is " + balance + ".  You may need to ulock your account.");
  });
  it("should have an owner", function() {
    Splitter.deployed().then(function(instance){
      instance.owner().then(function(test){console.log(test)});
      should.exist(instance.owner());
    });
  });
  it("should split a payment incrementing two accounts", function() {
    Splitter.deployed().then(function(instance){
       console.log("tesy" + instance.balances[accounts[1]]);
       instance.splitFunds(accounts[1], accounts[2], 1000000000000000000, {from: accounts[0]}).then(function() {

       assert.isAtLeast(instance.balances[accounts[1]], 50, "accounts[1] doesn't have any ether. the balance is " + instance.balances[accounts[1]] + ".  You may need to ulock your account.");
     
    });
    });

  });


});
