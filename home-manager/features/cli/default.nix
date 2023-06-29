{ pkgs, ... }: {
  imports = [
    ./bash.nix
    ./bat
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./gpg-agent.nix
    ./lsd.nix
    ./nnn.nix
    ./pfetch.nix
    ./ranger.nix
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
  ];

  home.sessionVariables = {
    PATH = "$PATH:$HOME/.local/bin";
    EDITOR = "${pkgs.helix}/bin/hx";
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";
  };

  home.packages = with pkgs; [
    aria2
    comma # Install and run programs by sticking a , before them
    #distrobox # Nice escape hatch, integrates docker images with my environment

    # archive stuff
    p7zip
    unzip
    unrar
    # misc
    gopass
    pamixer
    ponymix
    sshfs-fuse

    neofetch
    bc # Calculator
    btop # same
    dfc # better df
    mediainfo
    gdu
    #ncdu # TUI disk usage
    exa # Better ls
    ripgrep # Better grep
    fd # Better find
    file
    #toybox # toying around
    #httpie # Better curl
    jq # JSON pretty printer and manipulator
    #trekscii # Cute startrek cli printer
    tealdeer
    ps_mem

    #nix-zsh-completions
    nix-stray-roots
    #nix-prefetch-git
    #common-updater-scripts
  ];
}
