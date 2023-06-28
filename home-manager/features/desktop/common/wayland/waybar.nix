{ config, lib, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    waybar = pkgs.waybar.override {
      jackSupport = false;
      mpdSupport = false;
      sndioSupport = false;
      cavaSupport = false;
      swaySupport = false;
    };
  };

  programs.waybar.package = pkgs.waybar.overrideAttrs
    (oa: { mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ]; });

  programs.waybar = { enable = true; };
  #home.packages = [ pkgs.wttrbar ];
}
