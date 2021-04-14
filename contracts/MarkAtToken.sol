// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MarkAtToken is ERC721, ERC721Enumerable, ERC721URIStorage {
    struct MarkAtToken {
        string footprint;
    }
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    MarkAtToken[] public tokens;
    address public owner;

    constructor() ERC721("MarkAtToken", "MarkAtToken") {
        owner = msg.sender;
    }

    function mintMarkAtToken(
        string memory name,
        address account,
        string memory metadata
    ) public {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        tokens.push(MarkAtToken(name));
        _mint(account, newTokenId);
        _setTokenURI(newTokenId, metadata);
    }

    function safeMint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
