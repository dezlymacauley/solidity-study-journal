// SPDX-License-Identifier: MIT
// It is best practice for all Solidity contracts to start with the License

/*

Anyone who uses, modifies, or distributes the code,
must comply with the conditions outlined in the MIT License,
such as retaining the original copyright notice and disclaimer.

*/

// This line of code tells solidity to use version 0.8.18 of the compiler,
// or anything greater than that
pragma solidity ^0.8.18;

// NOTE: You can also have Solidity versions in a range
// pragma solidity >=0.8.18 <0.9.0;   


// The name of the contract is called SimpleStorage
// Everything inside the curly braces is the contract
contract SimpleStorage {

    // the variable is called myFavoriteNumber,
    // and the variable type is a uint256
    // uint256 means unsigned integer 
    // That means that it is a whole number that can only be positive
    // 256 means 256 bits. 
    // That is the size of the number that the integer can hold 
    uint256 myFavoriteNumber;

    // "Person" is a struct
    // Think of this as creating a custom variable type
    // Every variable that is created from the struct variable type,
    // must follow this template
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //-------------------------------------------------------------------------

    // NOTE: How to create a variable that follows the struct Person template
        
    // Person public dezly = Person({favoriteNumber: 7, name: "Dezly"});

    //-------------------------------------------------------------------------

    // listofPeople is an array that contains a list of variables.
    // The variable type of each of those variables is "Person"
    // public means that this variable is publically accessible
    // This is a dynamic array
    Person[] public listOfPeople;
   
    // NOTE: Static arrays
    // Person[3] public listOfPeople;
    // This would be mean a max size of 3 Persons (aka 3 variables)

    // This is a mapping called nameToFavoriteNumber,
    // This mapping takes in a string, and returns the matching number
    // E.g. You enter the name of a person,
    // and it will find that person's name and return their myFavoriteNumber
    // public means that this variable is publically accessible
    mapping(string => uint256) public nameToFavoriteNumber;

//-----------------------------------------------------------------------------

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {

        // This will add a new person and their favourite number to the array
        listOfPeople.push(Person(_favoriteNumber, _name));

        // This will create a mapping of the persons's name,
        // and their favourite number
        // gas efficient to retrieve this person's name later
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

//-----------------------------------------------------------------------------

}
