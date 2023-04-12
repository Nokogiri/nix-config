{ pkgs, ... }: {
  home.packages = with pkgs; [
    #rnix-lsp
    nixfmt
    #nix-diff
    nix-direnv
    #nix-top
    nix-tree
    #nix-pin
  ];
}
