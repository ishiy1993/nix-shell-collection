{ pkgs ? import <nixpkgs> {}, python-version ? "python3", python-libs ? (ps: []) }:

let
  py-env = pkgs.${python-version}.withPackages python-libs;
in
pkgs.mkShell {
  buildInputs = [
    py-env
    pkgs.python-language-server
  ];
}
