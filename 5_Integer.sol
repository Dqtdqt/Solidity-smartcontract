// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract mycontract {
    uint public myValue;
    function setNewValue (uint _myValue) public {
        myValue = _myValue;
    }
}