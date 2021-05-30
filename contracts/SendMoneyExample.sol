pragma solidity ^0.8.1;


contract SendMoneyExample {
    uint public moneyReceived;
    
    function sendMoney() public payable {
        moneyReceived += msg.value;    
    }
    
    function getBalance() public view returns (uint) {
        return (address(this)).balance;        
    }
    
    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        withdrawMoneyTo(to);
    }
    
    function withdrawMoneyTo(address payable toAddress) public {
        toAddress.transfer(getBalance());
    }
}
