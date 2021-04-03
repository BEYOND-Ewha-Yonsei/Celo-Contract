// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MarkAtToken is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("MarkAtToken", "MarkAtToken") {}

    function awardItem(address consumer, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _mint(consumer, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        return newTokenId;
    }
}
