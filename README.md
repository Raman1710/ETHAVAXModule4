# DegenToken (DGN) Smart Contract

DegenToken (DGN) is a decentralized ERC-20 token deployed on Avalanche blockchain. The token allows for easy transfer and burning of tokens and implements a time-based lock mechanism for redeeming tokens.

## Token Details

- Token Name: DegenToken
- Symbol: DGN
- Decimals: 18

## Functionality

### Minting

The token can be minted by the contract owner using the `mintDegen` function. Minting creates new tokens and adds them to the balance of the specified account.

```solidity
function mintDegen(address account, uint256 amount) public onlyOwner
```

### Transferring Tokens

Tokens can be transferred from one address to another using the `transferDegen` function. The function checks for valid recipient addresses, ensures the sender has sufficient balance, and performs the transfer.

```solidity
function transferDegen(address account, uint256 amount) external
```

### Redeeming Tokens

The token implements a time-based lock for redeeming tokens. After a specific duration (`REDEEM_LOCK_DURATION`), users can redeem their tokens using the `redeemDegen` function, provided they have sufficient unlocked tokens in their balance.

```solidity
function redeemDegen(uint256 amount) public
```

### Burning Tokens

Token holders can burn their tokens, removing them from the total supply, using the `burnDegen` function. The function checks for valid token amounts and sufficient balance before burning tokens.

```solidity
function burnDegen(uint256 amount) external
```

### Checking Token Balance

To retrieve the balance of DGN tokens for a specific account, you can use the `balanceDegen` function.

```solidity
function balanceDegen(address account) external view returns (uint256)
```

## License

This smart contract is released under the MIT License. Please refer to the SPDX-License-Identifier comment at the beginning of the contract for more details.

## Note

The `@openzeppelin/contracts` library is used for this smart contract. Make sure to include the correct version in your project to avoid any compatibility issues.
