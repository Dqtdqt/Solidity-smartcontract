pragma solidity >=0.5 <0.9;
 contract owned {
     address owner;
     constructor () public {
         owner = msg.sender;
     }
     modifier onlyOwner () {
         require(msg.sender == owner,"you are not allowed");
         _;
     }
 }

 contract inheritanceModifier is owned {
     mapping (address => uint) public tokenBalance;
     uint tokenPrice = 1 ether;
     constructor () public{
         tokenBalance[owner] = 100;
     }
     function createNewToken () public onlyOwner() {
         tokenBalance[owner] ++;
     }
     function burnToken () public onlyOwner(){
         tokenBalance[owner] --;
     }
 }