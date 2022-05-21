//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5 <0.9;
contract A {
    uint public Num;
    address public Sender;
    uint public Value;
    function setNewValue (address _contract, uint _Num) public payable{
        (bool success,) = _contract.delegatecall(
            abi.encodeWithSignature("setNewValue(uint256)",_Num)
        );
        require (success,"Transation failed");
    }
    function () public payable{

    }
}
contract B {
    uint public Num;
    address public Sender;
    uint public Value;
    function setNewValue (uint _Num) public payable {
        Num = _Num;
        Sender = msg.sender;
        Value = msg.value;
    }
}

contract B2 {
    uint public Num;
    address public Sender;
    uint public Value;
    function setNewValue (uint _Num) public payable {
        Num = _Num * 2;
        Sender = msg.sender;
        Value = msg.value;
    }
}