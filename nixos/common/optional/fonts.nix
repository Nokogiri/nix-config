{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts =
        nerdfonts.override { fonts = [ "CascadiaCode" "FiraMono" "FiraCode" ]; };
    };

  fonts.fonts = with pkgs; [
    nerdfonts
    cascadia-code
    dejavu_fonts
    unifont
    twemoji-color-font
    noto-fonts-cjk-sans
    weather-icons
  ];

  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = [ "Cascadia Code" ];
        sansSerif = [ "Cascadia Code" ];
        monospace = [ "Cascadia Mono" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
