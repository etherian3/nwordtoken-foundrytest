// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Nigga is ERC20 {
    constructor() ERC20("Nigga", "NIG") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }
}
