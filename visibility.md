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
