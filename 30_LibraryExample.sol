//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5 <0.9;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.3.0/contracts/math/SafeMath.sol"
contract LibraryExample {
    mapping (address => uint) public tokenBalance;
    using SafeMath for uint;

    constructor () public {
        tokenBalance[msg.sender]=tokenBalance[msg.sender].add(1);
    }
    
    function sendToken (address payable _to,uint _amount) public return (bool){
        
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount);

        return true;
    }
}