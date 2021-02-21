# 貝殻集め

## Usage

以下の `import <unstable> {}` は

```
$ nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
```

によるもの。

### Haskell
次の `shell.nix` をプロジェクトディレクトリにおき、`nix-shell` を起動する。

```nix
import /path/to/nix-shell-collection/haskell/stack/shell.nix {}
```

nixpkgsやghcのバージョンを変更するには次のようにする。

```nix
import /path/to/nix-shell-collection/haskell/stack/shell.nix { pkgs = import <unstable> {}; ghc-version = "ghc8103"; }
```

### Python
次の `shell.nix` をプロジェクトディレクトリにおき、`nix-shell` を起動する。

```nix
import /path/to/nix-shell-collection/python/shell.nix {}
```

nixpkgsやpythonのバージョンを変更する、またpythonのライブラリを利用するには次のようにする。

```nix
import /path/to/nix-shell-collection/python/shell.nix {
  pkgs = import <unstable> {};
  python-version = "python39";
  python-libs = (ps: [ ps.numpy ]);
}
```

### Rust + Python

```nix
{ pkgs ? import <unstable> {} }:

let
  python-shell = import /path/to/nix-shell-collection/python/shell.nix { pkgs = pkgs; };
  rust-shell = import /path/to/nix-shell-collection/rust/shell.nix { pkgs = pkgs; };
in
pkgs.mkShell {
  buildInputs = [
    python-shell.buildInputs
    rust-shell.buildInputs
  ];
}
```

