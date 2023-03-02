{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts = nerdfonts.override {
        fonts = [ "CascadiaCode" "FiraMono" "FiraCode" ];
      };
    };

  fonts.fonts = with pkgs; [
    nerdfonts
    cascadia-code
    dejavu_fonts
    terminus_font
    twemoji-color-font
    noto-fonts
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
        serif = [ "Cascadia Code SemiLight" ];
        sansSerif = [ "Cascadia Code SemiLight" ];
        monospace = [ "Cascadia Mono SemiLight" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
