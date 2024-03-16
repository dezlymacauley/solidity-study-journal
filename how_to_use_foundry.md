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
NOTE: This is the message that you will get,
if you deploy without running anvil first.

What Foundry will do, is open up a temporary anvil chain,
and deploy your contract.

---

Now let's try to deploy again on Foundry:

First have anvil running:

---

```
anvil
```

Remember to add the rpc url of anvil,
and a private-key from one of the anvil accounts

Don't forget to add "--broadcast",
or it will simple simulate deploying your contract.
You need to add "--broadcast" to actually deploy your contract on the chain.
In this case, anvil is the chain.

```
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
``` 


---

This will be the result:

❯ forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --b
roadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4
f2ff80

[⠆] Compiling...
No files changed, compilation skipped
EIP-3855 is not supported in one or more of the RPCs used.
Unsupported Chain IDs: 31337.
Contracts deployed with a Solidity version equal or higher than 0.8.20 might not wo
rk properly.
For more information, please see https://eips.ethereum.org/EIPS/eip-3855
Script ran successfully.

== Return ==
0: contract SimpleStorage 0x5FbDB2315678afecb367f032d93F642f64180aa3

## Setting up 1 EVM.

==========================

Chain 31337

Estimated gas price: 5 gwei

Estimated total gas used for script: 464097

Estimated amount required: 0.002320485 ETH

==========================
##
Sending transactions [0 - 0].
⠁ [00:00:00] [####################################################] 1/1 txes (0.0s)
##
Waiting for receipts.
⠉ [00:00:00] [################################################] 1/1 receipts (0.0s)
##### anvil-hardhat
✅  [Success]Hash: 0x23a8fb581b2341d70bfff5dd0a3e8618d18387500ab5e2e3dbe3fa31e9e558
ca
Contract Address: 0x5FbDB2315678afecb367f032d93F642f64180aa3
Block: 1
Paid: 0.001428352 ETH (357088 gas * 4 gwei)



==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
Total Paid: 0.001428352 ETH (357088 gas * avg 4 gwei)

Transactions saved to: /home/dezlymacauley/github-repos/solidity-study-journal/foun
dry-fundamentals/foundry-simple-storage/broadcast/DeploySimpleStorage.s.sol/31337/r
un-latest.json

Sensitive values saved to: /home/dezlymacauley/github-repos/solidity-study-journal/
foundry-fundamentals/foundry-simple-storage/cache/DeploySimpleStorage.s.sol/31337/r
un-latest.json

---

This piece of information here shows the name of your contract,
and the public address of that contract

0: contract SimpleStorage 0x5FbDB2315678afecb367f032d93F642f64180aa3

---

In case you need a reminded of where you deployed your contract to,
and other details, check the "broadcast" folder of your project.

There should be a folder there that has the name of the script,
that was used to deploy your contract

There should be a file called "run-latest.json"
This will show you the details of your latest deployment.

---

In the "transaction": section of that file,
look for the line that looks like this:

        "gas": "0x714e1",

That is the hex value of gas.

Foundry has a tool called "cast" that can convert hexidecimal values,
to numbers.

```
---

This will convert the hex value to its decimal value
```
cast --to-base 0x714e1 dec
```
 --to-base 0x714e1 dec


464097


The other value to take note of is nonce:

Every time a transaction is sent the nonce will go up.
Deploying your contract counts as a transaction.

The first time you deploy your contract, then nonce will will "0x0"

If you make another transaction. It will be 0x1 and so on. 

        "nonce": "0x1",

---

How to use a .env file to store your private-key and make it easier to deploy.

WARNING: This is only to be done for development and testing!!!
For a production product this is VERY bad practice.

And remember to create a .gitignore file so that your .env file, 
does not get pushed to GitHub

NOTE: This is usually done for you in Foundry already,
but it doesn't hurt to check.

Add a .env file to the root of your project:

Add your private key and RPC URL to the file.
Make sure that there are no spaces

PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC_URL=http://127.0.0.1:8543 

---

Then run the command 

```
source .env
```

To check that this worked:

```
echo $PRIVATE_KEY
```

```
echo $RPC_URL
```
---

Now you can use these environment variables to make your deployment command,
more concise:

This was the original command:
```
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

Remember to source your .env file every time you open the terminal
```
source .env
```

Your deployment can now be simplified to this:
```
forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY 
```
---

NOTE: DON't use .env anymore!

Now you can just use cast

---

Newer Method:

Encrypt using ERC-2335
```
cast wallet import defaultKey --interactive
```

"defaultKey" is the "name" of your account. 
It can be anything you want

You will be prompted to enter the private key,
and then you will be prompted to enter your password.

You can view this info:
```
cast wallet list
```

This will give you an output like this.
So you can see that a private key called "defaultKey" has been saved
```
solidity-study-journal/foundry-fundamentals/foundry-sim
ple-storage on  main [!] took 42s 
❯ cast wallet list
defaultKey (Local)
```

In case you are wondering where Foundry stores this encrypted private key...
You can find it at this location:

```
cd ~/.foundry/keystores/
```

This is encrypted using the standard:
ERC-2335:BLS12-381 Keystore

---

Now you can deploy your contract like:
NOTE: The address after "--sender is the public address of that private key"

Since this private key is one of the accounts on anvil,
you can find the public, address on anvil as well

```
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --account defaultKey --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --broadcast -vvvv 
```

This is the result:
```
❯ forge script script/DeploySimpleStorage.s.sol -
-rpc-url http://127.0.0.1:8545 --account defaultK
ey --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb
92266 --broadcast -vvvv

[⠢] Compiling...
No files changed, compilation skipped
EIP-3855 is not supported in one or more of the R
PCs used.
Unsupported Chain IDs: 31337.
Contracts deployed with a Solidity version equal 
or higher than 0.8.20 might not work properly.
For more information, please see https://eips.eth
ereum.org/EIPS/eip-3855
Traces:
  [317505] DeploySimpleStorage::run()
    ├─ [0] VM::startBroadcast()
    │   └─ ← ()
    ├─ [281718] → new SimpleStorage@0x5FC8d32690c
c91D4c39d9d3abcBD16989F875707
    │   └─ ← 1407 bytes of code
    ├─ [0] VM::stopBroadcast()
    │   └─ ← ()
    └─ ← SimpleStorage: [0x5FC8d32690cc91D4c39d9d
3abcBD16989F875707]


Script ran successfully.

== Return ==
0: contract SimpleStorage 0x5FC8d32690cc91D4c39d9
d3abcBD16989F875707

## Setting up 1 EVM.
==========================
Simulated On-chain Traces:

  [281718] → new SimpleStorage@0x5FC8d32690cc91D4
c39d9d3abcBD16989F875707
    └─ ← 1407 bytes of code


==========================

Chain 31337

Estimated gas price: 4.188392894 gwei

Estimated total gas used for script: 464097

Estimated amount required: 0.001943820576926718 E
TH

==========================
Enter keystore password:
##
Sending transactions [0 - 0].
⠁ [00:00:00] [##################] 1/1 txes (0.0s)
##
Waiting for receipts.
⠉ [00:00:00] [##############] 1/1 receipts (0.0s)
##### anvil-hardhat
✅  [Success]Hash: 0xdd12e3efffa7a7c7c6891c5fffc5
17e6ac2f95b8e8ac6cdd7ee7bb2bfc73f501
Contract Address: 0x5FC8d32690cc91D4c39d9d3abcBD1
6989F875707
Block: 6
Paid: 0.001257553260859456 ETH (357088 gas * 3.52
1690062 gwei)



==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
Total Paid: 0.001257553260859456 ETH (357088 gas 
* avg 3.521690062 gwei)

Transactions saved to: /home/dezlymacauley/github
-repos/solidity-study-journal/foundry-fundamental
s/foundry-simple-storage/broadcast/DeploySimpleSt
orage.s.sol/31337/run-latest.json

Sensitive values saved to: /home/dezlymacauley/gi
thub-repos/solidity-study-journal/foundry-fundame
ntals/foundry-simple-storage/cache/DeploySimpleSt
orage.s.sol/31337/run-latest.json
```

You can make entering the password more convienient by creating a ".password",
file.

WARNING: Just make sure to add the ".password" file to your .gitignore first!
You obviously don't want your password being pushed to GitHub

---

If you were deploying to a blockchain like Sepolia then you would have to modify the "--broadcast at the end"
```
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --account defaultKey --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --broadcast --verify --etherscan-api-key
```

---

```
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --account defaultKey --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --broadcast -vvvv 
```

0: contract SimpleStorage 0x5FbDB2315678afecb367f032d93F642f64180aa3

---

# How to interact with a (non-view) function in your smart contract from the command line:

Note: The value after send is the public address of the contract:
After that is the function name and the signature of that function in your contract,
that you are trying to access.

The signature is simply the inputs that the function in the contract requires.

E.g. In the SimpleStorage contract, there is a function called "store"
In order to work, this function needs to be given a _favoriteNumber value,
which is a unit256

So "store(uint256)" 123 
would be the same as store(123) in traditional coding.

```solidity

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }
```


```
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "store(uint256)" 123 rpc-url $RPC_URL --account defaultKey
```

This is the output you'll get after running that command:
```
❯ cast send 0x5FbDB2315678afecb367f032d93F
642f64180aa3 "store(uint256)" 123 rpc-url 
$RPC_URL --account defaultKey

Enter keystore password:

blockHash               0xecf7bb75b677f791
1c3ba3c172f977d83c70303b6245efb355ef386e31
f2f1be
blockNumber             2
contractAddress         
cumulativeGasUsed       43538
effectiveGasPrice       3877975734
from                    0xf39Fd6e51aad88F6
F4ce6aB8827279cffFb92266
gasUsed                 43538
logs                    []
logsBloom               0x0000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
000000000000000000000000000000000000000000
0000000000000000000000000000000000
root                    
status                  1
transactionHash         0x4219a2acd5c5ee74
912e5b1966b41183542a00b411078c79878c3703ce
3a9557
transactionIndex        0
type                    2
to                      0x5FbDB2315678afec
b367f032d93F642f64180aa3
depositNonce             null

```

---

# How interact with view functions:

E.g. I want to interact with the function called retrieve in my contract.

```solidity

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }
```

This is the command that you would use:
Note that for a view function you don't need the rpc-url or your private key,
because you are simply reading a value from the contract.

You are not modifying the values stored in the contract in any way.
```
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "retrieve()" 
```

When you do this you will get the hex value back:

0x000000000000000000000000000000000000000000000000000000000000007b

To convert the hex to decimal:
```
cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec
```

123

As you can see, it returned the value stored in the contract

---


cast --to-base 0x0000000000000000000000000000000000000000000000000000000000000309 dec
