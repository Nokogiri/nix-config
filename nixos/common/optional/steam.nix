{ pkgs, lib, config, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      steam = steam.override {
        extraPkgs = pkgs:
          with pkgs; [
            libgdiplus
            gamescope
            mangohud
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils
          ];
      };
    };
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    environment.systemPackages = with pkgs; [
      steam
    ];

}
