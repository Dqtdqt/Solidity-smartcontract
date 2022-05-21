// SPDX-License-Identifier:GPL-3.0

pragma solidity ^0.8.1;
contract myContract {
    bool public myTest;
    function thuDi (bool _trueFalse) public {
        myTest = _trueFalse;
    }

    function nguocThuDi() public {
        myTest =!myTest;
    }

    function viewbool () public view returns(bool) {
        return myTest;
    }
}
