//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5 <0.9;
contract myMapping {
    uint public balance;
    uint public receiveValue;
    uint public sendValue;
    function recieve() public payable {
        receiveValue += msg.value;
    }
    function getBalance () public view returns (uint){
        return address(this).balance;
    }
    function send(address payable _to, uint _amount) public {
        require(getBalance() >= _amount, "not enough funds");
        sendValue += _amount;
        _to.transfer(_amount);
    }
    function sender () public view returns (address) {
        return msg.sender;
    }
}