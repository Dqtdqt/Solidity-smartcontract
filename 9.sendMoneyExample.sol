// SPDX-License-Identifier:GPL-3.0;
pragma solidity ^0.5.13;

contract myContract {
    uint public balance;
    function receiveMoney () public payable {
    }
    
    function getBalance () public view returns (uint){
        return msg.value;
    }
    function sender () public view returns (address){
        return msg.sender;
    }
}