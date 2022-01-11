pragma solidity ^0.8.0;

contract Bank{

    event Deposit(address from, uint value);
    event Withdraw(address to, uint value);

    mapping(address => uint) balances;
    
    function deposit() public payable{
        balances[msg.sender]+=msg.value;

        emit Deposit(msg.sender, msg.value);
    }


    function withdraw(uint amount) public{
        if(balances[msg.sender]>=amount){
            balances[msg.sender]-=amount;
            msg.sender.transfer(amount);

        emit Withdraw(msg.sender, amount);
        }
    }


    function getMyBalance() public view returns(uint){
        return balances[msg.sender];
    }


    function getBankBalance() public view returns(uint){
        return this.balance;
    }

}


// @amesh712sol
 

