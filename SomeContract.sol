// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract SomeContract {
    uint public myUint = 10;
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
}