{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      interactiveShellInit = ''
        source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
      '';
    };
    command-not-found.enable = false;
  };

}
