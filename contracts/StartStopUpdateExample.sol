pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    address private owner;
    bool public paused;
    constructor() {
        owner = msg.sender;
    }
    
    function sendFunds() public payable {
        require(!paused, "Contract is paused");
    }
    
    function pause(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function withdraw(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        require(!paused, "Contract is paused");
        _to.transfer(payable(address(this)).balance);
    }
    
    function destroy(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}
