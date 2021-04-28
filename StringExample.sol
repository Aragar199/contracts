// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract StringExample {
    string public myString = 'hello world!';
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
