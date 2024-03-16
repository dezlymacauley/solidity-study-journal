// SPDX-License-Identifier: MIT

// NOTE: How to write a script in Foundry to deploy a Smart Contract
// To use this script, run the following command in the terminal:
// forge script script/DeploySimpleStorage.s.sol

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
            SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();

        return simpleStorage;

    }

}
