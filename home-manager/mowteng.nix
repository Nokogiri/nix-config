{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/desktop/eww
    ./features/desktop/games
    ./features/desktop/gtk.nix
    ./features/desktop/media
    ./features/helix
    ./features/desktop/hyprland
    inputs.nur.nixosModules.nur
  ];

  home.packages = with pkgs; [
    xfce.thunar
    transmission-remote-gtk
    snapcast
    dwarfs
    fuse-overlayfs
  ];

  programs = { password-store.enable = true; };
}
