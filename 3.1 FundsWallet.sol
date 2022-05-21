//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract FundWallet is Ownable {

    mapping(address => uint) public allowance;
    function addallowance (address _who, uint _amount) public onlyOwner{
        allowance[_who] = _amount;
    }

    function isOwner() public view returns (bool) {
        return owner () == msg.sender;
    }

    function reduceAllowance (address _who, uint _amount) public {
        allowance[_who] -= _amount;
    }
    modifier isOwnerOrAllwance (uint _amount) {
        require (isOwner() || allowance[msg.sender]>= _amount,"you are not allowed");
        _;
    }
    function withdrawMoney (address payable _to, uint _amount) public isOwnerOrAllwance (_amount){
        if (!isOwner()) {
            reduceAllowance (msg.sender, _amount);
        }
        _to.transfer(_amount);
    }

    receive () external payable {

    }
}