pragma solidity ^0.8.1;

contract MappingExample {
    mapping(uint => bool) public myBoolMapping;
    mapping(address => bool) public myAddressMapping;
    
    function setBoolMapping(uint _index) public {
        myBoolMapping[_index] = true;
    }
    
    function setAddressMapping() public {
        myAddressMapping[msg.sender] = true;
    }
}
