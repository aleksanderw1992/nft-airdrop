// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/BetcometsErc1155.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        BetcometsErc1155 betcometsErc1155 = new BetcometsErc1155();
        vm.stopBroadcast();
    }
}
