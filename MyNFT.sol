// SPDX-License-Identifier: MIT
// ERC721 NFT Test Contract

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**
 * @title MyNFT
 * @dev A simple ERC721 contract for minting non-fungible tokens (NFTs) with unique metadata URIs.
 * Inherits from OpenZeppelin's ERC721 and ERC721URIStorage, and uses Ownable for access control.
 */
contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    // Counter to keep track of token IDs
    Counters.Counter private _tokenIds;

    /**
     * @dev Constructor to set the name and symbol of the NFT collection.
     * The name is "MyNFT", and the symbol is "NFT".
     */
    constructor() ERC721("MyNFT", "NFT") {}

    /**
     * @dev Mints a new NFT to the specified recipient address with the given metadata URI.
     * Can only be called by the owner of the contract.
     * @param recipient The address that will receive the minted NFT.
     * @param tokenURI The metadata URI associated with the token.
     * @return The ID of the newly minted token.
     */
    function mintNFT(address recipient, string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment(); // Increment the token ID counter

        uint256 newItemId = _tokenIds.current(); // Get the new token ID
        _mint(recipient, newItemId); // Mint the NFT to the recipient
        _setTokenURI(newItemId, tokenURI); // Set the metadata URI for the token

        return newItemId; // Return the new token ID
    }
}
