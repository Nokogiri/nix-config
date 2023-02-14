{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/desktop/games
    ./features/desktop/media
    ./features/helix
    #./features/desktop/sway
    #./features/desktop/hyprland

    # Or modules exported from other flakes (such as nix-colors):
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.nixosModules.nur
    inputs.spicetify-nix.homeManagerModule
    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays your own flake exports (from overlays dir):
      outputs.overlays.modifications
      outputs.overlays.additions

      # Or overlays exported from other flakes:
      #inputs.hyprland.nixosModules.default
      #neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  # TODO: Set your username
  home = {
    username = "nokogiri";
    homeDirectory = "/home/nokogiri";
  };

  home.packages = with pkgs; [ gparted ];

  # Enable home-manager and git
  programs = {
    home-manager.enable = true;
    git.enable = true;
    gpg.enable = true;
    neovim.enable = true;
    password-store.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
}
