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
        warn_about_missing_glyphs = false,
        enable_wayland = true,
        default_cursor_style = "BlinkingUnderline",
        window_background_opacity = 0.95,
        hide_tab_bar_if_only_one_tab = true,
        show_tab_index_in_tab_bar = false,
        }
    '';
  };
}

