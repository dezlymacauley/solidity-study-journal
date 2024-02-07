How to test smart contracts using foundry

Step 1: Create a new folder and initialize Foundry
`forge init`

Note: That this only works with an empty folder, 
or a folder that is not initialized for git.

If this is your situation, then run this command instead:
`forge init --force`

---

The script folder contains a contract that will deploy your smart contract.

The src folder is where your actual smart contract is.

The test folder is where your test is.

---

Step 2: Build / Compile your contract
`forge build` (Think of this as sort of the equivalent of cargo run in Rust)


---

Step 3: Open your test file:

It will end with .t.sol

To run a test on all test functions in the .t.sol test file:
`forge test`

To run a test on a specific function in a file:
E.g.

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

`forge test --mt testFuzz_SetNumber`

---

There is a more advanced Fuzz test called Stateful Fuzzing.

Stateful Fuzzing = In Foundry they are known as invariant tests

---

What is Fuzz Testing?
This si when you supply random data to your system in an attempt to break it.


---
