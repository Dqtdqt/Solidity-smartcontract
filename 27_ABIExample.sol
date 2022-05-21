//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5 <0.9;
contract ABI {
    string public myStr = " hello world";
     function setNewValue (string memory _mystring) public {
         myStr = _mystring;
     }
}