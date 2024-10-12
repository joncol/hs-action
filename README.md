[![Build Status](https://github.com/joncol/hs-action/workflows/Haskell-CI/badge.svg)](https://github.com/joncol/hs-action/actions?query=workflow%3AHaskell-CI)

* hs-action
Testing GitHub CI actions for Haskell.

* Building and running
To build and run the project, use:
```bash
nix run .#hs-action:exe:hs-action-exe
```

To just build the project, use:
```bash
nix build
```

To show all Flake outputs, you can use:
```bash
nix flake show --option allow-import-from-derivation true
```
