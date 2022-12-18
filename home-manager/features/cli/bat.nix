{
  xdg.configFile."themes/Catppuccin-frappe.tmTheme".source =
    ./bat-Catppuccin-frappe.tmTheme;
  programs.bat = {
    enable = true;
    config.theme = "base16";
  };
}
