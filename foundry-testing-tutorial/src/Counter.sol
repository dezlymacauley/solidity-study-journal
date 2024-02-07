// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// NOTE: The keyword 'pubic' means that a function or variable,
// can be accessed from outside the contract

/*
The range of numbers for a uint256 in Solidity is from 0 to 2^256 - 1.
This means it can hold any non-negative integer value, 
up to a very large number.
*/

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
