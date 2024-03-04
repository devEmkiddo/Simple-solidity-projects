// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Faucet{
    address public owner;

    uint256 public contractBalance;
    uint256 public claimRate;
    uint256 public duration;

    mapping(address => uint256) private lastTimeClaimed;

    event Claimed(
        address indexed to,
        uint256 amount
    );

    event Deposit(
        address indexed sender,
        uint256 amount
    );

      constructor(uint256 _rate){
        owner = msg.sender;
        claimRate = _rate;
        duration = 86400 seconds;
      }

    function deposit() external payable{
       require(msg.value> 0, "Invalid amount");
       contractBalance += msg.value;
       emit Deposit(msg.sender, msg.value);
     }

     function setClaimRate(uint256 _rate) public{
       require(msg.sender == owner, "Only owner can set rate");
       claimRate = _rate;
     }

    function claim(address payable to) public {
       require(contractBalance >= claimRate, "Vault is exhausted");
       require(block.timestamp >= lastTimeClaimed[msg.sender] + duration, "Try again after a minimum of 24 hours");
       lastTimeClaimed[msg.sender] = block.timestamp;
       contractBalance -= claimRate;
       to.transfer(claimRate);
       emit Claimed(to, claimRate);
    }
}