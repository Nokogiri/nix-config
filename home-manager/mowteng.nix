{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/nix-stuff.nix
    ./features/desktop/common
    ./features/desktop/games
    ./features/desktop/gtk.nix
    ./features/desktop/media
    ./features/desktop/eww
    ./features/helix
    ./features/desktop/hyprland

    inputs.nix-colors.homeManagerModules.default
    inputs.nur.nixosModules.nur
  ];

  home.packages = with pkgs; [
    inputs.hyprpicker.packages.${system}.hyprpicker
    xfce.thunar
    transmission-qt
  ];

  programs = {
    password-store.enable = true;
  };
}
