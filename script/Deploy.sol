// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/BetcometsErc1155.sol";
///@notice Script to deploy contracts to local blockchain
/*
create .env file with your environments:
pk=...
MUMBAI_RPC_URL=
SEPOLIA_RPC_URL=
SEPOLIA_API_KEY=
POLYGON_RPC_URL=
POLYGON_API_KEY=

For local deployment use commands:
anvil
// pick from there private key and public key
export pk=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
forge script ./script/Deploy.sol:Deploy --fork-url http://localhost:8545 --private-key $pk --broadcast --resume

--- Deployment on testnet:
source .env
#forge script ./script/Deploy.sol:Deploy --fork-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
#forge create --rpc-url $SEPOLIA_RPC_URL --private-key $pk ./src/BetcometsErc1155.sol:BetcometsErc1155
forge create --rpc-url $SEPOLIA_RPC_URL --private-key $pk --etherscan-api-key $SEPOLIA_API_KEY --verify ./src/BetcometsErc1155.sol:BetcometsErc1155
forge create --rpc-url $POLYGON_RPC_URL --private-key $pk --etherscan-api-key $POLYGON_API_KEY --verify ./src/BetcometsErc1155.sol:BetcometsErc1155

forge create --rpc-url $SEPOLIA_RPC_URL --private-key $pk --etherscan-api-key $SEPOLIA_API_KEY --verify ./src/BetcometsErc721.sol:BetcometsErc721
forge create --rpc-url $POLYGON_RPC_URL --private-key $pk --etherscan-api-key $POLYGON_API_KEY --verify ./src/BetcometsErc721.sol:BetcometsErc721


verify cast is working:
cast call 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "uri()"

*/
contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new BetcometsErc1155();
        vm.stopBroadcast();
    }
}
