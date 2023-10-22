// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract BetcometsErc1155 is Ownable, ERC1155 {
    string private baseURI;
    string public name = "!Betcomets VIP!";
    string public symbol = "!BTCMVIP!";
    uint256 private tokenId = 0;
    
    constructor() Ownable(msg.sender) ERC1155("https://ibb.co/ThpLpYR") {
    }

    function setBaseURI(string calldata _uri) external onlyOwner {
        baseURI = _uri;
    }
    function setBaseUriAndIncrementTokenId(string calldata _uri) external onlyOwner {
        baseURI = _uri;
        tokenId++;
    }

    function airdrop(address[] memory addresses) external onlyOwner {
        for (uint i = 0; i < addresses.length; i++) {
            _mint(addresses[i], tokenId, 1, "");
        }
    }

    function uri(uint256) public view virtual override returns (string memory) {
        return baseURI;
    }
}