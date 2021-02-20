# 貝殻集め

## Usage

### Haskell
次の `shell.nix` をプロジェクトディレクトリにおき、`nix-shell` を起動する。

```nix
import /path/to/nix-shell-collection/haskell/stack/shell.nix { }
```

nixpkgsやghcのバージョンを変更するには次のようにする。

```nix
import /path/to/nix-shell-collection/haskell/stack/shell.nix { pkgs = import <unstable> {}; ghc-version = "ghc8103"; }
```

### Python (WIP: lspの動作確認をしていない)
次の `shell.nix` をプロジェクトディレクトリにおき、`nix-shell` を起動する。

```nix
import /path/to/nix-shell-collection/python/shell.nix { }
```

nixpkgsやpythonのバージョンを変更する、またpythonのライブラリを利用するには次のようにする。

```nix
import /path/to/nix-shell-collection/python/shell.nix { pkgs = import <unstable> {}; python-version = "python39"; python-libs = (ps: [ps.numpy]); }
```

