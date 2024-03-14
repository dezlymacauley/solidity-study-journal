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


---
