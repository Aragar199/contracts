// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract SimpleMappingExample {
    
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) uinUintBoolMapping;
    
    
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
    
    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
    
    function setMapMapping(uint _idx, uint _idx2, bool _value) public {
        uinUintBoolMapping[_idx][_idx2] = _value;
    }

}
