// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract FunctionsExample {
    mapping(address => uint) public balanceReceived;
    
    address payable owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    function getOwner() public view returns (address) {
        return owner;
    }
    
    function convertWeiToEth(uint _amountInWei) public pure returns(uint){
        return _amountInWei / 1 ether;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    receive () external payable {
        receiveMoney();
    }
}
