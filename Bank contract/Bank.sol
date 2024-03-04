// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract BankContract{
    mapping(address => uint256) private _balance;

    event Transfer(
        address indexed sender,
        address indexed receipient,
        uint256 amount
    );
    event Withdraw(
        address indexed owner,
        uint256 amount
    );
    
    function deposit() public payable{
       _balance[msg.sender] += msg.value;
    }
    function transfer(address payable receipient, uint256 amount) public{
       require(balance(msg.sender) >= amount, "Insufficient Balance");
       _balance[msg.sender] -= amount;
       _balance[receipient] += amount;
       receipient.transfer(amount);
       emit Transfer(msg.sender, receipient, amount);
    }

    function withdraw(uint256 amount) public{
        require(balance(msg.sender) >= amount, "Insufficient Balance to withdraw");
         _balance[msg.sender] -= amount;
         payable(msg.sender).transfer(amount);
         emit Withdraw(msg.sender, amount);
    }
    function balance(address receipient) public view returns(uint256){
       return _balance[receipient];
    }
}