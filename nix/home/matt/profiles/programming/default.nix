{ ... }: {
  imports = [
    ./modules/golang.nix
    ./modules/nix.nix
    ./modules/nodejs.nix
    ./modules/rust.nix
    ./modules/vscode.nix
  ];
}
