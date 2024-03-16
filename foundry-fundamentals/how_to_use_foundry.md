# How to use Foundry to develop Smart Contracts
Create a new folder with the project name.

Then run the following command:

If the directory is empty then use:
```
forge init
```

If the directory is not empty then use:
```
forge init --force .
```

Note: In order to use "forge init" in a repo that is already a git repo,
you must have a clean working tree first. 
So push any unsaved changes to GitHub first,
before trying to create a new Foundry project with the ```forge init``` command

How to compile your contract:

```
forge compile
```

How to deploy a smart contract locally

```
anvil
```

This will give you some fake test accounts,
as well as private keys for those accounts.

When you run anvil you will see this at the end of the output:

Then you have this end point or RPC URL

Listening on 127.0.0.1:8545

---

### Step 1: Create a Network

Go to your MetaMask Wallet:

Add a network manually

---

Network name: Localhost

New RPC URL: http://127.0.0.1:8545

(Note this chain ID is for local deployments using Anvil)
Chain ID: 31337

Currency Symbol: GO

Leave "block explorer url" empty because this is a local blockchain

---

### Step 2: Create an account on MetaMask
Use on of the public keys created by anvil, 
and the coresponding private key

Eg.

Public key:
(0) 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000.000000000000000000 ETH)


Private key:
(0) 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

To create an account, go to your MetaMask Wallet and import the private keys

---

### Step 3: How to deploy your contract locally using Anvil

```
forge create name-of-the-contract-that-you-want-to-deploy
```

E.g.
Note:
The part that reads "--rpc-url http://127.0.0.1:8543" (the rpc url for anvil),
is optional when you are deploying to anvil

```
forge create SimpleStorage --rpc-url http://127.0.0.1:8545 --interactive

```
You will be prompted for the private key:

0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

---

Here is another way to deploy your contract without the prompt.
Just add the private key as part of the terminal command:

NOTE: It is bad practice to explicity type out your private key,
like this in plain text! Never do this with an account that has real money!


```
forge create SimpleStorage --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```



You will get an output that looks like this:

[⠒] Compiling...
No files changed, compilation skipped
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Deployed to: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
Transaction hash: 0x0e989355be558786bb9650463b6a09fcfce9e4003379
c9a0bac651

---

# How to write a script that will deploy your smart contract

In the root directory of your Foundry project,
there should be a folder called "script/"

Inside that folder, create a smart contract deployment script.

The naming format is:

"DeployNameOfContract.s.sol"

E.g.

"DeploySimpleStorage.s.sol"


---

Here is an example of a script:

```solidity
// SPDX-License-Identifier: MIT

// NOTE: How to write a script in Foundry to deploy a Smart Contract

// Make sure that the version of Solidity used by your script,
// is compatible with the version of Solidity that you are using
pragma solidity ^0.8.18;

// This will import the Script from the Script.sol contract,
// in the the forge standard library
import {Script} from "forge-std/Script.sol";

// Import the contract that you want this script to deploy
import {SimpleStorage} from "../src/SimpleStorage.sol";

// This DeploySimpleStorage contract will inherit all of the functionality,
// of Script.sol
contract DeploySimpleStorage is Script {
    
    // "run" is the command that gets called when we go to deploy the contract

    function run() external returns(SimpleStorage) {

        // vm is a special keyword in the forge standard library
        // it can only be used in the Foundry framework

        // If you want to set some boilerplate code,
        // before you start sending transactions,
        // place your code before vm.startBroadcast
        // E.g. uint256 startingValue = 1;

        vm.startBroadcast();
            // Any transactions that need to be sent will be placed here. 
           
            
            // NOTE: SimpleStorage is the variable type
            // simpleStorage (lowercase s) is the variable name

            // This will send a new transaction,
            // to deploy a new simple storage contract
            SimpleStorage simpleStorage = new SimpleStorage;
        vm.stopBroadcast();

        return simpleStorage;

    }

}
```

To use this script, run the following command in the terminal:
```
forge script script/DeploySimpleStorage.s.sol
```

Your output will look like this:
```
❯ forge script script/DeploySimpleStorage.s.sol 
[⠆] Compiling...
[⠘] Compiling 21 files with 0.8.19
[⠃] Solc 0.8.19 finished in 2.34s
Compiler run successful!
Script ran successfully.
Gas used: 338569

== Return ==
0: contract SimpleStorage 0x90193C961A926261B756D1E5b
b255e67ff9498A1

If you wish to simulate on-chain transactions pass a 
RPC URL.
```

---
