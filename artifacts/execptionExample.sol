pragma solidity ^0.5.13;
contract execptionExample {
    mapping (address => Balance) public balanceReceive;
   
    function receiveMoney () public payable {
        balanceReceive[msg.sender] += msg.value;
    }
    function withdrawMoney (address payable _to, uint _amount) public {
        if(balanceReceive[msg.sender]>= _amount){
        balanceReceive[msg.sender] -= _amount;
        _to.transfer(_amount);
        }
    }
}