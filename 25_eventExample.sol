// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5 <0.9;
contract eventExample {
    mapping (address => uint) public tokenBalance;
    event tokenTransation (address _sender, address _to, uint _amount);

    constructor () public{
        tokenBalance[msg.sender] = 100;
    }
    function sendToken (address payable _to, uint _amount) public {
        tokenBalance[msg.sender] -= _amount ; tokenBalance[_to]+= _amount;
        emit tokenTransation (msg.sender, _to, _amount);
    }


    
}