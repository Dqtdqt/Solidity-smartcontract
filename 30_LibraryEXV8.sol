//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5 <0.9;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
contract LibraryExample {
    mapping (address => uint) public tokenBalance;
    using SafeMath for uint;

    constructor () {
        tokenBalance[msg.sender]=tokenBalance[msg.sender].add(1);
    }
    
    function sendToken (address payable _to,uint _amount) public returns (bool){
        
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount,"not enough token!!!");
        tokenBalance[_to] = tokenBalance[_to].add(_amount);
        return true;

    }
}