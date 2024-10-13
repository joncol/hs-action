{
  description = "hs-action";

  inputs = {
    haskellNix.url = "github:input-output-hk/haskell.nix";
    nixpkgs.follows = "haskellNix/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, flake-utils, haskellNix, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        overlay = final: prev: {
          hsPkgs = final.haskell-nix.project' rec {
            src = ./.;
            compiler-nix-name = "ghc966";
            shell = {
              tools = {
                cabal = { };
                cabal-fmt = { };
                fourmolu = { };
                ghcid = { };
                haskell-language-server = {
                  version = "latest";
                  # Disable unnecessary plugins, some of which cause compilation
                  # errors.
                  configureArgs =
                    "-f-floskell -f-fourmolu -f-ormolu -f-stylishhaskell -f-brittany";
                };
                hlint = { };
                hoogle = { };
              };

              # Non-Haskell shell tools.
              buildInputs = with pkgs; [ haskell-ci ];
            };
          };
        };
        overlays = [ haskellNix.overlay overlay ];
        pkgs = builtins.foldl' (acc: overlay: acc.extend overlay)
          nixpkgs.legacyPackages.${system} overlays;
        flake = pkgs.hsPkgs.flake { };
      in flake // {
        defaultPackage = flake.packages."hs-action:exe:hs-action-exe";
      });
}
