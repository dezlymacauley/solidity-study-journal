// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import {Test, console} from "forge-std/Test.sol";
import {AlwaysZeroContract} from "../src/AlwaysZero.sol" ;

contract AlwaysZeroTest {
    
    AlwaysZeroContract exampleContract; 
 
    // This is a regular unit test
    // This will only check that the variable "shouldAlwaysBeZero",
    // is 0 when the data passed into to function is 0.
    // This unit test is only checking out this situation.
    function testIAlwaysGetZeroUnit() public {
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    // This is an invariant test (aka Stateful Fuzzing)
    // When you run this test, foundry will input random data,
    // into the function to test that it is behaving normally.
    function testIAlwaysGetZeroFuzz(uint256 data) public {
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

}

