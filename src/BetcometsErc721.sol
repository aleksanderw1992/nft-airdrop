// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BetcometsErc721 is ERC721Enumerable, Ownable {
    using Strings for uint256;  // Required for converting tokenId to string

    string private _baseTokenURI;
    uint256 private _currentTokenId = 0;

    // Setting up default values for name, symbol, and baseTokenURI in the constructor.
    constructor() Ownable(msg.sender) ERC721("!Betcomets VIP!", "!BTCMVIP!") {
        _baseTokenURI = "https://ibb.co/ThpLpYR";
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string memory baseTokenURI) external onlyOwner {
        _baseTokenURI = baseTokenURI;
    }

    function _mintToken(address recipient) internal {  // changed function name to avoid confusion
        _currentTokenId++;
        _safeMint(recipient, _currentTokenId);
    }

    function airdrop(address[] memory recipients) external onlyOwner {
        for (uint256 i = 0; i < recipients.length; i++) {
            _mintToken(recipients[i]);  // changed to the new internal function
        }
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_isTokenOwner(tokenId), "ERC721Metadata: URI query for nonexistent token");  // changed the function to _isTokenOwner
        string memory base = _baseURI();
        return bytes(base).length > 0 ? string(abi.encodePacked(base, tokenId.toString())) : "";
    }

    function _isTokenOwner(uint256 tokenId) internal view returns (bool) {  // helper function
        return ownerOf(tokenId) != address(0);
    }
}
