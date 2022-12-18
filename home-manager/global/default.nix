{ inputs, lib, pkgs, config, ... }: {
  imports = [ ../features/cli ];
  #++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    #overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
    tmux.enable = true;
  };
  home = {
    username = lib.mkDefault "nokogiri";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.05";
  };
}
