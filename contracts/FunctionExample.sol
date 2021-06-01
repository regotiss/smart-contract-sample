pragma solidity ^0.8.1;

contract FunctionExample {
    mapping(address => uint) receivedMoney;
    address payable owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    function getOwner() public view returns (address) {
        return owner;
    }
    
    function destory() public {
        require(msg.sender == owner, "You are not the owner");    
        selfdestruct(owner);
    }
    
    function getEtherFromWei(uint _wei) public pure returns (uint) {
        return _wei/1 ether;
    }
    
    function sendMoney() public payable {
        assert(receivedMoney[msg.sender] + msg.value > receivedMoney[msg.sender]);
        receivedMoney[msg.sender] += msg.value;
    } 
    
    function withdrawMoney(address payable _to, uint amount) public {
        require(amount <= receivedMoney[msg.sender]);
        assert(receivedMoney[msg.sender] > receivedMoney[msg.sender]-amount);
        
        receivedMoney[msg.sender] -= amount;
        _to.transfer(amount);
    }
    
    receive() external payable {
        sendMoney();
    }
}
