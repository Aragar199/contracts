// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

import "./Allowance.sol";

contract SimpleWallet is Allowance {
    
    event MoneySent(address _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        if(owner() != msg.sender) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
    
    function renounceOwnership() override public pure {
        revert("Can't renounce ownership here");
    }
    
    fallback () external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}