{ pkgs, ... }: {
  xdg.configFile."bat/themes/Catppuccin-mocha.tmTheme".source =
    ./Catppuccin-mocha.tmTheme;
  programs.bat = {
    enable = true;
    config.theme = "Catppuccin-mocha";
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };
}
