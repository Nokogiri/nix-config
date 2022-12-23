{ pkgs, ... }:{
  xdg.configFile."themes/Catppuccin-frappe.tmTheme".source =
    ./bat-Catppuccin-frappe.tmTheme;
  programs.bat = {
    enable = true;
    config.theme = "Catppuccin-frappe";
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };
}
