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

