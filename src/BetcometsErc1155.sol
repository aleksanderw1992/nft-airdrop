
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Betcomets is Ownable, ERC1155 {
    string private baseURI;
    string public name = "!Betcomets VIP!";
    string public symbol = "!BTCMVIP!";

    constructor() ERC1155("") {
    }

    function setBaseURI(string calldata _uri) external onlyOwner {
        baseURI = _uri;
    }

    function airdrop(address[] memory addresses) external onlyOwner {
        for (uint i = 0; i < addresses.length; i++) {
            _mint(addresses[i], 0, 1, "");
        }
    }

    function uri(uint256) public view virtual override returns (string memory) {
        return baseURI;
    }
}