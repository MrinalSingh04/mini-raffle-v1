// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/MiniRaffle.sol";

contract DeployMiniRaffle is Script {
    function run() external {
        vm.startBroadcast();
        MiniRaffle raffle = new MiniRaffle();
        vm.stopBroadcast();

        console2.log("MiniRaffle deployed at:", address(raffle));
    }
}
