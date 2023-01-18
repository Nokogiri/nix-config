{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
       return {
        color_scheme = "Catppuccin Frappe",
        font_size = 13.0 ,
        font = wezterm.font_with_fallback {
            'CaskaydiaCove Nerd Font Mono',
          },
        window_background_opacity = 0.95,
        }
    '';
  };
}
