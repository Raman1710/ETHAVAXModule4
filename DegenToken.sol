// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable {
    uint256 public constant REDEEM_LOCK_DURATION = 30 days; // Adjust the lock duration as needed

    mapping(address => uint256) private _mintTimestamps;

    constructor() ERC20("Degen", "DGN") {}

    function mintDegen(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
        _mintTimestamps[account] = block.timestamp;
    }

    function transferDegen(address account, uint256 amount) external {
        require(account != address(0), "Oops! Invalid recipient address.");
        require(amount > 0, "Oops! Invalid Degen amount.");
        require(amount <= balanceOf(msg.sender), "Sorry, you have insufficient balance.");

        _transfer(msg.sender, account, amount);
    }

    function redeemDegen(uint256 amount) public {
        require(amount > 0, "Oops! Invalid Degen amount.");
        require(amount <= balanceOf(msg.sender), "Sorry, you have insufficient balance.");

        require(
            block.timestamp >= _mintTimestamps[msg.sender] + REDEEM_LOCK_DURATION,
            "Tokens are still locked. Please wait to redeem."
        );

        _burn(msg.sender, amount);
    }

    function balanceDegen(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    function burnDegen(uint256 amount) external {
        require(amount > 0, "Oops! Invalid Degen amount.");
        require(amount <= balanceOf(msg.sender), "Sorry, you have insufficient balance.");

        _burn(msg.sender, amount);
    }
}
