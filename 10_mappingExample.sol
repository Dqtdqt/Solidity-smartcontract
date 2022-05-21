//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.5.13;
contract simpleMapping {
    mapping (uint => bool) public myMapping;
    function setValue (uint _index) public {
        myMapping [_index] = true;
    }
}