{ pkgs, lib, config, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      steam = steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            gst_all_1.gst-vaapi
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-ugly
            libgdiplus
            gamescope
            glib.bin
            gsettings-desktop-schemas
            #mangohud
            mono
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            xorg.libXdmcp
            xorg.libXau
            libpng
            gtk3
            gtk3-x11
            libgdiplus
            zlib
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            SDL2
            libkrb5
            keyutils
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-plugins-bad
            xdg-user-dirs
          ];
      };
    };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
