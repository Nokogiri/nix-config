{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    #./features/desktop/bspwm
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/desktop/games
    ./features/desktop/gtk.nix
    ./features/desktop/media
    #./features/desktop/eww
    ./features/helix
    ./features/desktop/hyprland
    ./features/desktop/i3
    #./features/desktop/sway
    inputs.nur.nixosModules.nur
  ];

  #  nixpkgs = {
  #    overlays = [
  #      inputs.nixpkgs-wayland.overlay
  #    ];
  #  };

  home.packages = with pkgs; [
    xfce.thunar
    transmission-remote-gtk
    snapcast
    dwarfs
    fuse-overlayfs
    chromium
    brave
  ];

  programs = { password-store.enable = true; };
}
