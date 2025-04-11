// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Nigga} from "src/Nigga.sol";

contract TestNigga is Test {
    Nigga public nigga;
    address public owner;

    function setUp() public {
        owner = address(this);
        nigga = new Nigga();
    }

    function testNameAndSymbol() public view {
        assertEq(nigga.name(), "Nigga");
        assertEq(nigga.symbol(), "NIG");
    }

    function testInitialSupply() public view {
        uint256 expected = 100000 * 10 ** nigga.decimals();
        assertEq(nigga.totalSupply(), expected);
        assertEq(nigga.balanceOf(owner), expected);
    }

    function testTransfer() public {
        address recipient = address(0x123);
        uint256 amount = 1e18;
        console.log(
            "before transfer recipinet balance: ",
            nigga.balanceOf(recipient)
        );
        console.log("before transfer owner balance: ", nigga.balanceOf(owner));

        nigga.transfer(recipient, amount);
        assertEq(nigga.balanceOf(recipient), amount);
        assertEq(nigga.balanceOf(owner), nigga.totalSupply() - amount);
        console.log(
            "after transfer recipient balance: ",
            nigga.balanceOf(recipient)
        );
        console.log("after transfer owner balance: ", nigga.balanceOf(owner));
    }
}
