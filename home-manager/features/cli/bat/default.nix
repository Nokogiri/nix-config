{ pkgs, ... }: {
  xdg.configFile."bat/themes/Catppuccin-frappe.tmTheme".source =
    ./Catppuccin-mocha.tmTheme;
  programs.bat = {
    enable = true;
    config.theme = "Catppuccin-frappe";
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };
}
