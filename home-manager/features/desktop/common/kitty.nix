{
  xdg.configFile."kitty/tab_bar.py".source = ./kitty-tab_bar.py;
  #home.sessionVariables = { TERMINAL = "kitty"; };
  programs = {
    kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 12;
      };
      theme = "Catppuccin-Frappe";
      #theme = "Nord";
      settings = {
        # General settings
        kitty_mod = "ctrl+shift";
        linux_display_server = "auto";
        touch_scroll_multiplier = "6.0";
        wayland_titlebar_color = "system";
        hide_window_decorations = true;
        scrollback_lines = 9000;
        scrollback_pager =
          "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";
        scrollback_pager_history_size = 0;
        wheel_scroll_multiplier = 5;
        mouse_hide_wait = 3;
        enabled_layouts = "*";

        # Cursor settings
        cursor = "#00bcd4";
        cursor_text_color = "#00bcd4";
        cursor_shape = "block";
        cursor_blink_interval = "-1";
        cursor_stop_blinking_after = 15;

        # URL settings
        url_color = "#0087bd";
        url_style = "double";
        open_url_with = "default";
        copy_on_select = true;
        strip_trailing_spaces = "never";
        select_by_word_characters = ":@-./_~?&=%+#";
        click_interval = "-1.0";
        focus_follows_mouse = false;
        pointer_shape_when_grabbed = "arrow";

        # Bell settings
        enable_audio_bell = false;
        visual_bell_duration = 0;
        window_alert_on_bell = true;
        bell_on_tab = false;
        command_on_bell = "none";

        # Tab settings
        tab_bar_edge = "bottom";
        tab_bar_margin_height = "0.0 0.0";
        tab_bar_margin_width = "0.0";
        tab_bar_align = "left";
        tab_bar_style = "custom";
        tab_bar_min_tabs = 1;
        tab_switch_strategy = "previous";
        tab_fade = "0.25 0.5 0.75 1";
        #tab_separator = "";
        tab_activity_symbol = "none";
        tab_powerline_style = "angled";
        active_tab_font_style = "bold";
        inactive_tab_font_style = "normal";
        tab_title_template = ''
          "{f'{title[:30]}…' if title.rindex(title[-1]) + 1 > 30 else (title.center(6) if (title.rindex(title[-1]) + 1) % 2 == 0 else title.center(5))}"'';

        # Misc settings
        disable_ligatures = "cursor";
        #symbol_map = "U+F000-U+F0FF Weather Icons";
        adjust_line_height = 0;
        adjust_column_width = 0;
        repaint_delay = 8;
        input_delay = 3;
        sync_to_monitor = true;
        shell = ".";
        editor = ".";
        close_on_child_death = false;
        allow_remote_control = true;
        listen_on = "unix:/tmp/kitty";
        update_check_interval = 0;
        startup_session = true;
        clipboard_control =
          "write-clipboard write-primary read-clipboard read-primary";
        #term = "xterm-kitty";

        # Window settings
        remember_window_size = true;
        initial_window_width = 800;
        initial_window_height = 900;
        #enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
        window_resize_step_cells = 2;
        window_resize_step_lines = 2;
        window_border_width = 3;
        draw_minimal_borders = true;
        window_margin_width = 0;
        single_window_margin_width = "-1";
        window_padding_width = "3 12";
        placement_strategy = "center";
        bell_border_color = "#ff5a00";
        inactive_text_alpha = 1;
        resize_debounce_time = "0.1";
        resize_draw_strategy = "scale";

        # Opacity settings
        background_opacity = "0.94";
        dim_opacity = "0.4";

      };
      keybindings = {
        "kitty_mod+c" = "copy_to_clipboard";
        "kitty_mod+v" = "paste_from_clipboard";
        "kitty_mod+s" = "paste_from_selection";
        "shift+insert" = "paste_from_selection";
        "kitty_mod+o" = "pass_selection_to_program";
        "kitty_mod+up" = "scroll_line_up";
        "kitty_mod+k" = "scroll_line_up";
        "kitty_mod+down" = "scroll_line_down";
        "kitty_mod+j" = "scroll_line_down";
        "kitty_mod+page_up" = "scroll_page_up";
        "kitty_mod+page_down" = "scroll_page_down";
        "kitty_mod+home" = "scroll_home";
        "kitty_mod+end" = "scroll_end";
        "kitty_mod+h" = "show_scrollback";
        "kitty_mod+enter" = "new_window";
        "kitty_mod+n" = "new_os_window";
        "kitty_mod+w" = "close_window";
        "kitty_mod+]" = "next_window";
        "kitty_mod+[" = "previous_window";
        "kitty_mod+f" = "move_window_forward";
        "kitty_mod+b" = "move_window_backward";
        "kitty_mod+`" = "move_window_to_top";
        "kitty_mod+r" = "start_resizing_window";
        "kitty_mod+1" = "first_window";
        "kitty_mod+2" = "second_window";
        "kitty_mod+3" = "third_window";
        "kitty_mod+4" = "fourth_window";
        "kitty_mod+5" = "fifth_window";
        "kitty_mod+6" = "sixth_window";
        "kitty_mod+7" = "seventh_window";
        "kitty_mod+8" = "eighth_window";
        "kitty_mod+9" = "ninth_window";
        "kitty_mod+0" = "tenth_window";
        "kitty_mod+right" = "next_tab";
        "kitty_mod+left" = "previous_tab";
        "kitty_mod+t" = "new_tab";
        "kitty_mod+q" = "close_tab";
        "kitty_mod+." = "move_tab_forward";
        "kitty_mod+," = "move_tab_backward";
        "kitty_mod+alt+t" = "set_tab_title";
        "kitty_mod+l" = "next_layout";
        "shift+up" = "move_window up";
        "shift+left" = "move_window left";
        "shift+right" = "move_window right";
        "shift+down" = "move_window down";
        "kitty_mod+equal" = "change_font_size all +2.0";
        "kitty_mod+minus" = "change_font_size all -2.0";
        "kitty_mod+backspace" = "change_font_size all 0";
        "kitty_mod+e" = "kitten hints";
        "kitty_mod+p>f" = "kitten hints --type path --program -";
        "kitty_mod+p>shift+f" = "kitten hints --type path";
        "kitty_mod+p>l" = "kitten hints --type line --program -";
        "kitty_mod+p>w" = "kitten hints --type word --program -";
        "kitty_mod+p>h" = "kitten hints --type hash --program -";
        "Alt+Insert" = "kitten grab1.py";
        "kitty_mod+f11" = "toggle_fullscreen";
        "kitty_mod+f10" = "toggle_maximized";
        "kitty_mod+u" = "kitten unicode_input";
        "kitty_mod+f2" = "edit_config_file";
        "kitty_mod+escape" = "kitty_shell window";
        "kitty_mod+a>m" = "set_background_opacity +0.1";
        "kitty_mod+a>l" = "set_background_opacity -0.1";
        "kitty_mod+a>1" = "set_background_opacity 1";
        "kitty_mod+a>d" = "set_background_opacity default";
        "kitty_mod+delete" = "clear_terminal reset active";
      };
    };
  };
}
