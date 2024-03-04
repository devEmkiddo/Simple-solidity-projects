// SPDX-License-Identifier: MIT
pragma solidity 0.8;

 contract piggyBank{
    address payable owner;

    constructor(){
        owner = payable(msg.sender);
    }
    function deposit() public payable{ require(msg.value > 0, "Cannot be blank"); }

    function breakBank() public{
        selfdestruct(owner);
    }

    receive() external payable { }
}