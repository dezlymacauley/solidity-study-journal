# In Solidity, functions and variables can be marked with certain keywords
# These keywords add or limit functionality, 
# and can lead to gas savings

## internal
Only visible when looking at the contract code.
This is the default in Solidity, if you don't set an option.

## private
Only visible in the current contract.

## public
Visible from both inside and outside the contract.
Other people can a variable of function with this marking

## external
Only visible externally. I.e. Can only be message-called

## returns(variable type)
Shows what the function returns

---

# Keywords for functions that don't use gas

## view
This is a function that reads state on the blockchain.
In simple terms, it tells you the value of a variable stored in the contract.
Nothing else. 
A function marked as view is not allowed to modify the state of the contract.


## pure
A pure function is not allowed to modify the state of the contract on chain,
and it is not even allowed to read from the contract.

An example of a pure function is a function that simply makes a calculation.

---

# EVM Keywords

EVM stands for the Ethereum Virtual Machine

EVM can access and store information in six places:

1. Stack
2. Memory
3. Storage
4. Calldata
5. Code
6. Logs

## Storage
These are permanent variables that can be modified.
If you create a variable outside of a function but within your contract,
that variable will automatically default to "storage".

## Calldata
Means this variable is only going to exist temporarily
The variable will only exist for the duration of the function call.

A variable declared as "calldata" can't be modified.

So TLDR... Calldata = a temporary variable that you **can not modify**.

## Memory
Means this variable is only going to exist temporarily
The variable will only exist for the duration of the function call.
Inside of functions, most variables default to "memory" variables.

"string" is a special data type in solidity so you have to use the keywords,
"memory" or "calldata".

The difference between memory and calldata is that a memory variable,
can be changed.

So TLDR... Memory = a temporary variable that **can** be modified.

NOTE: So why do we need to use the keyword "memory",
when working with a string e.g. _name,
but no such keyword is needed for _favoriteNumber which is a uint256?

This is because the memory keyword specifies Data Location.
And Data Location can only be specified,
when the variable type is one of these:

1. array
2. struct
3. mapping

"uint256 _favoriteNumber" is a primitive data type,
so it doesn't fit the above requirement.

So what about 
```solidity

string memory _name
```

a string is NOT a primitive type.
A string is actually an array of bytes

So when working with strings you have to use either "memory" or "calldata".

Use "memory" if you plan to modifiy the value during the function.
Use "calldata" is you don't want to modify the value during the function.

```solidity

    function addPerson(string memory _name, uint256 _favoriteNumber) public {

        // This will add a new person and their favourite number to the array
        listOfPeople.push(Person(_favoriteNumber, _name));

        // This will create a mapping of the persons's name,
        // and their favourite number
        // gas efficient to retrieve this person's name later
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
```

---
