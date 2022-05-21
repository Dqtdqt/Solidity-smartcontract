// SPDX-License-Identifier:GPL-3.0

pragma solidity ^0.5.13;

contract mycontract {
    string public myStr = "Hello World";
    function setNewStr (string memory _nhapChuoi) public {
        myStr = _nhapChuoi;
    }
}