{ pkgs, lib, config, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      steam = steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            libgdiplus
            gamescope
            glib.bin
            gsettings-desktop-schemas
            mangohud
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            SDL2
            libkrb5
            keyutils
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-plugins-bad
          ];
      };
    };
  home.packages = with pkgs; [ steam steam-run steam-rom-manager ];
}
