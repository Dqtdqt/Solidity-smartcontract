// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract mycontract {
    bool public myBool;
    function setNewBool (bool _myBool) public {
        myBool = _myBool;
    }
    function negaBool () public {
        myBool = !myBool;
    }
    function retrieve () public view returns (bool) {
        return myBool;
    }
}