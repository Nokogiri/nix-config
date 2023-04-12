{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/desktop/games
    ./features/desktop/gtk.nix
    ./features/desktop/media
    ./features/helix
    ./features/desktop/hyprland
    inputs.nur.nixosModules.nur
  ];

  #    nixpkgs = {
  #      overlays = [
  #        inputs.extest.packages.x86_64-linux
  #      inputs.nixpkgs-wayland.overlay
  #      ];
  #    };

  home.packages = with pkgs; [
    xfce.thunar
    transmission-remote-gtk
    snapcast
    dwarfs
    fuse-overlayfs
  ];

  programs = { password-store.enable = true; };
}
