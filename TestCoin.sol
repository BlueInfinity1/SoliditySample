// A test coin implementation with minting, burning, and standard ERC20 capabilities.
// Provides an example of an ERC20 token with additional owner-controlled minting.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestCoin is ERC20, Ownable {
    /**
     * @dev Constructor to set the name, symbol, and initial supply of the token.
     * The initial supply is minted to the deployer's address.
     * @param initialSupply The initial token supply (without decimals).
     */
    constructor(uint256 initialSupply) ERC20("TestCoin", "TST") {
        // Mint the initial supply to the contract deployer's address
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    /**
     * @dev Mint new tokens to a specified address.
     * Only the owner of the contract can call this function.
     * @param to The address to receive the newly minted tokens.
     * @param amount The amount of tokens to mint (without decimals).
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * 10 ** decimals());
    }

    /**
     * @dev Burn tokens from the caller's account.
     * Reduces the total supply of tokens.
     * @param amount The amount of tokens to burn (without decimals).
     */
    function burn(uint256 amount) public {
        _burn(msg.sender, amount * 10 ** decimals());
    }

    // ===========================
    // Functions Provided by ERC20
    // ===========================

    /**
     * @dev `ERC20` provides the following standard functions:
     *
     * - `totalSupply()`: Returns the total supply of tokens.
     * - `balanceOf(address account)`: Returns the token balance of a specific address.
     * - `transfer(address recipient, uint256 amount)`: Transfers tokens from the caller to the recipient.
     * - `approve(address spender, uint256 amount)`: Allows `spender` to transfer up to `amount` tokens on behalf of the caller.
     * - `transferFrom(address sender, address recipient, uint256 amount)`: Transfers tokens from `sender` to `recipient` (requires prior approval).
     * - `allowance(address owner, address spender)`: Returns the remaining tokens `spender` is allowed to transfer on behalf of `owner`.
     *
     * Additionally, it emits the following events:
     * - `Transfer(address indexed from, address indexed to, uint256 value)`: Emitted when tokens are transferred.
     * - `Approval(address indexed owner, address indexed spender, uint256 value)`: Emitted when approval is granted.
     */
}
