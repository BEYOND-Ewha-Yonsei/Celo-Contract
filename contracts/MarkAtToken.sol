// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MarkAtToken is ERC721 {
    constructor() ERC721("MarkAtToken", "MAT") {}

    function mint(address _to, uint256 _tokenId) public {
        _mint(_to, _tokenId);
    }
}
