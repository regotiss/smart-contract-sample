pragma solidity ^0.8.1;

contract MappingStructExample {
    struct Payment {
        uint amount;
        uint timestamp;
    }
    struct Balance {
        uint totalBalance;
        uint numberOfPayments;
        mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceReceived;
    
    function getBalance() public view returns (uint) {
        return (address(this)).balance;
    }
    
    function senMoney() public payable {
        Balance storage balance = balanceReceived[msg.sender];
        balance.totalBalance += msg.value;
        
        balance.payments[balance.numberOfPayments] = Payment(msg.value, block.timestamp);
        balance.numberOfPayments++;
    }
    
    function withdrawMoney(address payable _to, uint amount) public {
        Balance storage balance = balanceReceived[msg.sender];
        require(balance.totalBalance >= amount, "Insufficient balance");
        balance.totalBalance -= amount;
        
        _to.transfer(amount);
    }
    
    function withdrawAllMoney(address payable _to) public {
        Balance storage balance = balanceReceived[msg.sender];
        uint amountToSend = balance.totalBalance;
        balance.totalBalance = 0;
        
        _to.transfer(amountToSend);
    }
}
