// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    // This is a regular test
    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }
    
    // This is a fuzz test
    // It is testing the SetNumber function in the Counter.sol smart contract. 
    // It is testing the function with a random input of numbers each time.
    // That's what the x is for
    // By default, Foundry will test the contract with 256 runs

    // NOTE: How to change the number of default runs
    // Go to the Foundry.toml file
    // Click on this link: 
    // https://github.com/foundry-rs/foundry/blob/master/crates/config/README.md#all-options
    // Look for the section "[fuzz]"

    /*
        [fuzz]
        runs = 256
        max_test_rejects = 65536
        seed = '0x3e8'
        dictionary_weight = 40
        include_storage = true
        include_push_bytes = true
    */

    // Paste this into your Foundry.toml file
    // Paste it on a new line, right after "libs = [libs]"
    // Then change "runs = 256" to the number that you desire

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
