{ pkgs, ...}:
{
  home.packages = with pkgs;[
    rnix-lsp
    nixfmt
    nix-diff
    nix0direnv
    nix-top
    nix-tree
    nix-pin
  ];
}
