// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Nigga} from "src/Nigga.sol";

contract DeployNigga is Script {
    function run() external {
        vm.startBroadcast();
        new Nigga();
        vm.stopBroadcast();
    }
}
