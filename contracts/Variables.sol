pragma solidity ^0.8.1;

contract Variables {
    uint256 public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    bool public myBoolean;
    function setMyBoolean(bool _myBoolean) public {
        myBoolean = _myBoolean;
    }
    
    uint8 public mySmallNum;
    function increment() public {
        mySmallNum++;
    }
    
    function decrement() public {
        mySmallNum--;
    }
    
    address public myAddress;
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalance() public view returns (uint) {
        return myAddress.balance;
    } 
    
    string public mystring = 'hello';
    
    function setString(string memory _myString) public {
        mystring = _myString;
    }
}
