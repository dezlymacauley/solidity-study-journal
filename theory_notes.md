What are ERC20 Tokens?
It's a smart contract that represents a token.
E.g. Link, AAVE, Maker

ERC tokens are fungible. E.g. 1 Link token will always be equal,
to anther 1 Link token.

What is an NFT? (A non-fungible token)
An NFT is also called an ERC-721 token
It is a token standard similar to the ERC20 

Non-Fungible means that the tokens are unique from each other in the same class.

NFT are tokens that are deployed on a smart contract platform.
You can view NFTs on OpenSea or Rarible

---

ERC20 Tokens have a simple mapping between an address,
and how much that address holds.


```solidity

contract ERC20 is Context, IERC20 {
    mapping (address => uint256) private _balances;
}

```

---

ERC-721 tokens (NFTs) have a unique token IDS

```solidity
// Mapping from token ID to owner address
    mapping (address => uint256) private _owners;

```

In addition to this, they have a token URI


---

Top Web3 Attacks:
1. Price Oracle Manipulation
2. Reward Manipulation
3. Stolen Private Keys
4. Insufficient Function Access Control
5. Logic Error
6. Function Parameter Validation
7. Read-Only Reentrancy
8. Reenterancy
9. Governance
10. Misconfiguration

---
