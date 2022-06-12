// contracts/CCToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CCToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("ConC", "CC") {
        _mint(msg.sender, initialSupply);
    }
}