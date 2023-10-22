// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BetcometsErc1155.sol";

contract BetcometsErc1155Test is Test {
    BetcometsErc1155 public contractUnderTest;
    
    function setUp() public {
        contractUnderTest = new BetcometsErc1155();
    }
    
    function testSetBaseURI() public {
        string memory newURI = "https://new.uri.example";
        contractUnderTest.setBaseURI(newURI);
        assertEq(contractUnderTest.uri(0), newURI);
    }
    
    function testSetBaseUriAndIncrementTokenId() public {
//        string memory initialURI = "https://ibb.co/ThpLpYR";
        // Initializing the URI directly
        string memory newURI = "https://another.uri.example";
        
        contractUnderTest.setBaseUriAndIncrementTokenId(newURI);
        
        // tokenId would have been incremented, so uri for new tokenId should be the newURI
        assertEq(contractUnderTest.uri(1), newURI);
    }
    
    
    function testAirdrop() public {
        address[] memory recipients = new address[](3);
        recipients[0] = address(0x1223);
        recipients[1] = address(0x1224);
        recipients[2] = address(0x1225);
        
        contractUnderTest.airdrop(recipients);
        
        for (uint i = 0; i < recipients.length; i++) {
            assertEq(contractUnderTest.balanceOf(recipients[i], 0), 1);
            // Check if each recipient received 1 token of tokenId 0
        }
    }
}
