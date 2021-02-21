{ pkgs ? import <nixpkgs> {}, ghc-version ? "ghc884" }:
let
  ghc = pkgs.haskell.compiler.${ghc-version};
in
pkgs.mkShell {
  buildInputs = [
    ghc
    pkgs.cabal-install
    pkgs.ormolu
    pkgs.haskell-language-server
    pkgs.haskellPackages.implicit-hie
    pkgs.haskellPackages.cabal-fmt
  ];

  shellHook = ''
    export NIX_GHC="${ghc}/bin/ghc"
    export NIX_GHCPKG="${ghc}/bin/ghc-pkg"
    export NIX_GHC_DOCDIR="${ghc}/share/doc/ghc/html"
    export NIX_GHC_LIBDIR="${ghc}/lib/ghc-$($NIX_GHC --numeric-version)"
  '';
}
