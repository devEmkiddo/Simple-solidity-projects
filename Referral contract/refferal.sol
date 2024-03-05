// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Referral {
    mapping(address => address) public referralOf;
    mapping(address => uint256) public referralCount;
    uint256 public referralReward;
     
     constructor(){
        referralReward = 1 ether;
     }
    function refer(address _refered) public{
        require(_refered != msg.sender, "Cannot refer your self");
        require(referralOf[_refered] == address(0), "Already refered");
        referralOf[msg.sender] = _refered;
        referralCount[msg.sender] += 1;
        claim(payable(msg.sender));
    } 

    function claim(address payable referee) internal{
        if(referralCount[msg.sender] >= 2){
            referee.transfer(referralReward);
        }
    }

    receive() external payable { }
}