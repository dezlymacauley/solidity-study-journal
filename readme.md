# 󰡪 Solidity Study Journal

---

### Environment Setup (Arch Linux)


First make sure that you have the build tools installed:

`sudo pacman -S gcc`

`sudo pacman -S clang`


Next install the Solidity Compiler and the language server as well:
NOTE: On Arch Linux the only way to do this is via the AUR.

You will need an AUR helper like paru:
https://github.com/Morganamilo/paru

After installing paru, you can use it to install the solidity Compiler:
`paru -S solidity-bin`

`paru -S solidity-language-server`

To confirm that you now have the compiler, run the following command.
`solc --version`

---

https://docs.soliditylang.org/en/v0.8.23/installing-solidity.html



How to install Foundry:

https://book.getfoundry.sh/getting-started/installation

`curl -L https://foundry.paradigm.xyz | bash`

---

How to update Foundry:

Simply run the command `foundryup`

To check if it installed correctly try out the following: 

`forge --version`
`cast --version`
`anvil --version`
`chisel --version`

---

### How to create a new Solidity project with Foundry
- create your project folder
- cd to that folder
- then run the command `forge init`
- NOTE: If the folder is not empty you will get an error
- To initialize Foundry in a project that is not empty,
run the following command `forge init --force`

---

### How to compile your smart contract using Foundry
- After you have initialzed the project (forge init)
- Add your solidity file `NameOfContract.sol` in the src folder
- Then you need run the command `forge compile` or `forge build` 

---

Transaction Fee = Gas Price * Gas Used

---
