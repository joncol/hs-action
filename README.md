# Template for Haskell + Nix projects

More or less copied from <https://github.com/jonascarpay/template-haskell>, with
some changes to reflect my personal preferences.

Uses IOHK's [haskell.nix](https://github.com/input-output-hk/haskell.nix) to
set up an environment containing `ghc`, `cabal`, `hoogle`, `ghcid`, `fourmolu`,
and `haskell-language-server`.

# Usage

First, clone this repository:

    git clone https://gitlab.com/joncol/hs-template <my-project>

Then run the wizard script:

    cd <my-project>
    ./wizard.sh

# Building your project

Build your project either by running:

    nix-build

Or via `cabal`:

    cabal build


# Running your project

Show the outputs of your flake by running:

    nix flake show --option allow-import-from-derivation true

Run the wanted app via:

    nix run .#<app>

For example, if the name of your app is `hello:exe:hello-exe`, you can start it
with:

    nix run .#hello:exe:hello-exe

Of course, you can also use `cabal` for this:

    cabal run hello-exe
