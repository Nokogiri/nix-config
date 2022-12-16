{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./lsd.nix
    ./ranger.nix
    ./ssh.nix
    ./starship.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    #distrobox # Nice escape hatch, integrates docker images with my environment

    bc # Calculator
    bottom # System viewer
    ncdu # TUI disk usage
    exa # Better ls
    ripgrep # Better grep
    fd # Better find
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    #trekscii # Cute startrek cli printer

    rnix-lsp # Nix LSP
    nixfmt # Nix formatter
    nix-diff
    nix-direnv
    nix-top
    nix-tree
    nix-pin
    nix-zsh-completions
  ];
}
