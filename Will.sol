// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract WillContract{
    //Their dad wants us to give sam 10 eth and ken 5 eth
    //Lawyer deploys the contract
    //When ever their dad passes on they will get their eth
    address public owner;
    address payable public sam;
    address payable public ken;
    uint256 public etherForSam;
    uint256 public etherForKen;
    
    bool isDeseased;
    bool isShared;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(){
       owner = msg.sender;
       sam = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
       ken = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
       etherForSam = 10 ether;
       etherForKen = 5 ether;
    }

    function isDead() public {
        require(!isDeseased, "Is already deseased");
        isDeseased = true;
    }

    function shareProperties() public onlyOwner{
        require(isDeseased, "Cannot share properties when the willer is not deseased");
        require(!isShared, "Properties have been distributed accordingly");
        sam.transfer(etherForSam);
        ken.transfer(etherForKen);
    }
    receive() external payable { }
}