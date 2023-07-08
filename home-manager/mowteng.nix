{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/desktop/games
    #./features/desktop/gtk.nix
    ./features/desktop/media
    ./features/helix
    ./features/desktop/eww
    ./features/desktop/hyprland
    #    ./features/desktop/sway
    inputs.nur.nixosModules.nur
  ];

  nixpkgs.overlays = [ inputs.hyprland.overlays.hyprland-extras ];
  home.packages = with pkgs; [
    #pcmanfm-qt
    transmission-qt
    snapcast
    dwarfs
    fuse-overlayfs
    obsidian

    xournalpp
    # graphics stuff
    inkscape
    gimp
    krita
  ];

  programs = { password-store.enable = false; };
}
