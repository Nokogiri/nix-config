{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts = nerdfonts.override {
        fonts = [ "FiraMono" "FiraCode" "JetBrainsMono" ];
      };
    };

  fonts.fonts = with pkgs; [
    nerdfonts
    fira
    fira-code
    fira-mono
    dejavu_fonts
    jetbrains-mono
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
        serif = [ "FiraCode Nerd Font" ];
        sansSerif = [ "FiraCode Nerd Font" ];
        monospace = [ "FiraCode Nerd Font Mono" ];
        emoji = [ "Twitter Color Emoji" ];
      };
    };
  };
}
