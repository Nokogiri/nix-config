# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./sops.nix
    ../features/cli
    ../colors
    inputs.nix-colors.homeManagerModules.default
    inputs.sops-nix.homeManagerModules.sops
  ];
  #home-manager.useGlobalPkgs = true;
  #home-manager.useUserPackages = true;
  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
      #outputs.overlays.master-pkgs
      #(self: super: {
      #    mangohud = inputs.masterpkgs.legacyPackages.x86_64-linux.mangohud;
      #})

      # Or overlays exported from other flakes:
      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = lib.mkDefault "nokogiri";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.05";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  #home.packages = with pkgs; [ steam ];

  programs = {
    home-manager.enable = true;
    git.enable = true;
    gpg.enable = true;
    neovim.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
