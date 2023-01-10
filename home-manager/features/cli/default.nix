{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./bat.nix
    ./fzf.nix
    ./git.nix
    ./lsd.nix
    ./nix-index.nix
    ./pfetch.nix
    ./ranger.nix
    ./ssh.nix
    ./starship.nix
    ./zsh.nix
  ];

  home.sessionVariables = { PATH = "$PATH:$HOME/.local/bin"; };

  home.packages = with pkgs; [
    #comma # Install and run programs by sticking a , before them
    #distrobox # Nice escape hatch, integrates docker images with my environment

    tmux
    # archive stuff
    unzip
    unrar
    # misc
    gopass
    pamixer
    ponymix
    sshfs-fuse
    mailctl

    neofetch
    bc # Calculator
    btop # same
    dfc # better df
    mediainfo
    ncdu # TUI disk usage
    exa # Better ls
    ripgrep # Better grep
    fd # Better find
    file
    #toybox # toying around
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    #trekscii # Cute startrek cli printer
    tealdeer
    ps_mem

    nix-zsh-completions
    nix-stray-roots
  ];
}
