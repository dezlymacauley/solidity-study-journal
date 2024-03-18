Go to the Alchemy website

https://www.alchemy.com

You will need to have an account on Alchemy

Click "Create new app"

### Fill in the following details:

Chain:          Ethereum
Network:        Ethereum Sepolia
Name:           SimpleStorage-EthereumSepolia-Alchemy
Description:    SimpleStorage-EthereumSepolia-Alchemy

---

### The next step is to get an RPC_URL

If you click "API key"

You will see an HTTPS end point that looks like this:
https://eth-sepolia.g.alchemy.com/v2/_v6JoAi0bggyRQfOpyRbf7EfSWpJ6hjM

This is also known as an RPC_URL

---

### The next step is to get the private key of the crypto wallet,
### that you want to use to deploy the contract

Go to your MetaMask Account


Click "Select a Network"

Make sure that "Show test networks" is available

Click "Sepolia"

Select an account that has some Sepolia ETH

NOTE: Change the name of the account from "Account1",
to something a bit more descriptive. "sepolia-test-account-metamask"
This will be helful when you want to add this account,
to Foundry later in this guide.

NOTE: If you want to get some Sepolia ETH,
you can get this from Alchemy as well.

https://www.alchemy.com/faucets/ethereum-sepolia


Now that this account has some Sepolia ETH,
you need the private key.

NOTE: Never expose your private key or share it online with anyone.


---

To get the private key of your account. 

Select the account.

Click "Account details"

You will be shown the public key of that account:
0xfE301B6a4DA8969FF1010Eb4dbc30f503EB68b1B

This is safe to expose in public. Think of this as an email address.

Click "Show Private Key"

You will be prompted for your MetaMask password:

This is your private key:
29d0685b02a8d2586bd07c8475faf368088f8bf5728aa92cf8a64ca01d949ce9

---

### Create a key in Foundry that will be used to deploy your contract

This key will ensure that your private key is encrypted

```
cast wallet import sepolia-test-account-metamask --interactive 
```

You will be promted to paste in your private key. This will be the only time,
you have to expose your private key. Your private key will not be visible when pasted.

And after you paste it, it will be encrypted and stored in the Foundry key store.

And then you will be prompted to create a password. 
This password is what you will use to interact with this key.

After making your key you will get an output that looks like this:

```
❯ cast wallet import sepolia-test-account-metamask --inte
ractive

Enter private key:
Enter password: 
`sepolia-test-account-metamask` keystore was saved succes
sfully. Address: 0xfe301b6a4da8969ff1010eb4dbc30f503eb68b
1b
```

The value of "Address:" is actually the matching public key,
of the private key that you just encrypted.

NOTE: In your MetaMask wallet your public key may be displayed with capitalization.
E.g. 0xfE301B6a4DA8969FF1010Eb4dbc30f503EB68b1B

Don't worry. Public keys are NOT case sensitive so both are valid.
What is important is that the values are the same.

---

Now to deploy your contract:

Load the RPC_URL from from your .env file 
```
source .env
```

NOTE: That the numbers after the "--sender" amount,
is actually the public key of the account that you are using to send
the transaction.


0xfE301B6a4DA8969FF1010Eb4dbc30f503EB68b1B

```
forge script $DEPLOY_SCRIPT --rpc-url $RPC_URL --account $SENDER_PRIVATE_KEY --sender $SENDER_PUBLIC_KEY --broadcast
```

Rememeber to add the "--broadcast" at the end. 
If you don't add that, Foundry will simply simulate deploying your contract,
but your contract won't actually be deployed to your intended target.

---

I actually created a script that will deploy the SimpleStorage contract,
in one command.

# NOTE: How to use this script:

# Step 1: Make sure that you are in the root directory of your project

```
cd ~/github-repos/simple-storage-foundry/
```

# Step 2:
First make this script executable by running this command while:

```
chmod +x deploy-SimpleStorage.sh
```

# Step 3:
Source this script to make the command available:
```
source deploy-SimpleStorage.sh
```

# Step 4:
You can now deploy your contract with one command!
Use this command:

```
deploy-SimpleStorage
```
---

After running the script: You will get an output that looks like this:

```
simple-storage-foundry on  main [?] 
❯ deploy-SimpleStorage 
[⠆] Compiling...
[⠆] Compiling 21 files with 0.8.19
[⠰] Solc 0.8.19 finished in 1.96s
Compiler run successful!
Script ran successfully.

== Return ==
0: contract SimpleStorage 0xA379f2991aF07FB09C9c2023712FE542f8Fb72CA

## Setting up 1 EVM.

==========================

Chain 11155111

Estimated gas price: 197.1056662 gwei

Estimated total gas used for script: 464097

Estimated amount required: 0.0914761483664214 ETH

==========================
Enter keystore password:
##
Sending transactions [0 - 0].
⠁ [00:00:00] [###############################################################] 1/1 txes (0.0s)
##
Waiting for receipts.
⠉ [00:00:32] [###########################################################] 1/1 receipts (0.0s)
##### sepolia
✅  [Success]Hash:
Contract Address: 
Block: 5510729
Paid: 0.0417151583



==================

ONCHAIN EXECUTION 
Total Paid: 0.0417

Transactions saved
ySimpleStorage.s.s

Sensitive values s
ySimpleStorage.s.s
```


---

Where it says:
✅  [Success]Hash:

You can also find this hash on Alchemy

You also have the address of the contract:
0: contract SimpleStorage 0xA379f2991aF07FB09C9c2023712FE542f8Fb72CA

Now if you go to the sepolia testnet on Etherscan, 
you should be able to see this.

```
https://sepolia.etherscan.io/
```

And paste the the contract address, you should be able to view what happend

---

# NOTE: THIS is the manual way. There is a better way to do this.

# How to verify your smart contract on Etherscan

Click the tab that says "Contract"

You will then see a line that reads "Verify and Publish"

Add the Solidity version used by your contract and the license

Paste the contract code into the block

Where it says Optimization. Set that to Yes

Complete the caption

---
