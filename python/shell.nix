{ pkgs ? import <nixpkgs> {}, python-version ? "python3", python-libs ? (ps: []) }:

let
  py = pkgs.${python-version};
  py-env = py.withPackages python-libs;
in
pkgs.mkShell {
  buildInputs = [
    py-env
    py.pkgs.python-language-server
    py.pkgs.jedi
    py.pkgs.yapf
    py.pkgs.pytest
  ];
}
