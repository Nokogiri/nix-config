{ config, lib, pkgs, ... }:

let cfg = config.wayland.windowManager.sway.config;
in {
  wayland.windowManager.sway = {
    enable = true;
    #package = inputs.nixpkgs-wayland.sway-unwrapped
    #package = pkgs.swayfx;
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway

      export FADE_TIME=0.5
      export ALT_FADE_TIME=0.2
      export CON_INAC=0.8
      #export WLR_RENDERER=vulkan
    '';
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    config = {
      assigns = {
        "1" = [{ app_id = "kitty"; }];
        "2" = [ { app_id = "firefox"; } { app_id = "chromium-browser"; } ];
        "3" = [{ app_id = "mpv"; }];
        "4" = [ { class = "Emacs"; } { app_id = "emacs"; } ];
        "5" = [
          { app_id = "org.pwmt.zathura"; }
          { app_id = "com.github.maoschanz.drawing"; }
        ];
        "6" = [{ class = "Steam"; }];
        "7" = [
          { class = "Spotify"; }
          { app_id = "spotify-qt"; }
          { app_id = "dev.alextren.Spot"; }
        ];
        "8" = [

        ];
        "9" = [{ class = "Com.github.johnfactotum.Foliate"; }];
      };
      bars = [ ]; # {
      #  id = "1";
      #  command = "${pkgs.waybar-hyprland}/bin/waybar";
      #  position = "top";
      #  mode = "dock";
      #}];
      colors = {
        background = "#ffffff";
        focused = {
          border = "#cba6f7";
          background = "#cba6f7";
          text = "#1d1f21";
          indicator = "#8abeb7";
          childBorder = "#cba6f7";
        };
        focusedInactive = {
          border = "#282a2e";
          background = "#282a2e";
          text = "#c5c8c6";
          indicator = "#282a2e";
          childBorder = "#282a2e";
        };
        placeholder = {
          border = "#1d1f21";
          background = "#1d1f21";
          text = "#c5c8c6";
          indicator = "#1d1f21";
          childBorder = "#1d1f21";
        };
        unfocused = {
          border = "#1e1e2e";
          background = "#1e1e2e";
          text = "#c5c8c6";
          indicator = "#282a2e";
          childBorder = "#282a2e";
        };
        urgent = {
          border = "#cc6666";
          background = "#cc6666";
          text = "#1d1f21";
          indicator = "#cc6666";
          childBorder = "#cc6666";
        };
      };
      floating = {
        border = 1;
        criteria = [
          { app_id = "pavucontrol"; }
          { app_id = "retroarch"; }
          { app_id = ".blueman-manager-wrapped"; }
          { app_id = "nm-connection-editor"; }
          {
            app_id = "org.kde.kdeconnect-indicator";
          }
          #{ app_id = "mpv"; }
          { title = "File Operation Progress"; }

        ];
        modifier = "Mod4";
      };
      focus = { followMouse = true; };
      fonts = {
        names = [ "mononoki Nerd Font" ];
        style = "Regular";
        size = 10.0;
      };
      gaps = {
        inner = 3;
        outer = 6;
        smartBorders = "on";
        smartGaps = false;
      };
      input = {
        "1:1:AT_Translated_Set_2_keyboard" = {
          xkb_layout = "us,de";
          xkb_options = "grp:alt_space_toggle";
          xkb_variant = "altgr-intl,";
        };
        "type:touchpad" = {
          events = "enabled";
          tap = "enabled";
        };
        "1386:18888:Wacom_HID_49C8_Finger" = { map_to_output = "eDP-1"; };
        "1386:18888:Wacom_HID_49C8_Pen" = { map_to_output = "eDP-1"; };
      };
      keybindings = {
        # Basics apps
        "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
        "${cfg.modifier}+p" = "exec fuzzel";

        # basic internals
        "${cfg.modifier}+Shift+q" = "kill";
        "${cfg.modifier}+Shift+c" = "reload";

        # navigate windows
        "${cfg.modifier}+Left" = "focus left";
        "${cfg.modifier}+Down" = "focus down";
        "${cfg.modifier}+Right" = "focus right";
        "${cfg.modifier}+Up" = "focus up";

        # move windows
        "${cfg.modifier}+Shift+Left" = "move left";
        "${cfg.modifier}+Shift+Down" = "move down";
        "${cfg.modifier}+Shift+Right" = "move right";
        "${cfg.modifier}+Shift+Up" = "move up";

        # splitting
        "${cfg.modifier}+h" = "split h";
        "${cfg.modifier}+v" = "split v";

        # fullscreen
        "${cfg.modifier}+f" = "fullscreen toggle";

        # container layouts
        "${cfg.modifier}+s" = "layout stacking";
        "${cfg.modifier}+g" = "layout tabbed";
        "${cfg.modifier}+e" = "layout toggle split";

        # floating
        "${cfg.modifier}+Shift+f" = "floating toggle";
        "${cfg.modifier}+Shift+space" = "fcous mode-toggle";

        # focus parent
        "${cfg.modifier}+a" = "focus parent";

        # focus child
        "${cfg.modifier}+d" = "focus child";

        # switch to ws
        "${cfg.modifier}+Tab" = "workspace back_and_forth";
        "${cfg.modifier}+1" = "workspace number 1";
        "${cfg.modifier}+2" = "workspace number 2";
        "${cfg.modifier}+3" = "workspace number 3";
        "${cfg.modifier}+4" = "workspace number 4";
        "${cfg.modifier}+5" = "workspace number 5";
        "${cfg.modifier}+6" = "workspace number 6";
        "${cfg.modifier}+7" = "workspace number 7";
        "${cfg.modifier}+8" = "workspace number 8";
        "${cfg.modifier}+9" = "workspace number 9";

        # move containers 
        "${cfg.modifier}+Shift+1" = "move container to workspace number 1";
        "${cfg.modifier}+Shift+2" = "move container to workspace number 2";
        "${cfg.modifier}+Shift+3" = "move container to workspace number 3";
        "${cfg.modifier}+Shift+4" = "move container to workspace number 4";
        "${cfg.modifier}+Shift+5" = "move container to workspace number 5";
        "${cfg.modifier}+Shift+6" = "move container to workspace number 6";
        "${cfg.modifier}+Shift+7" = "move container to workspace number 7";
        "${cfg.modifier}+Shift+8" = "move container to workspace number 8";
        "${cfg.modifier}+Shift+9" = "move container to workspace number 9";
        # scratchpad
        "${cfg.modifier}+Shift+minus" = "move scratchpad";
        "${cfg.modifier}+minus" = "scratchpad show";

        # sway-prop
        "${cfg.modifier}+Shift+i" = "exec /home/nokogiri/.local/bin/sway-prop";

        "${cfg.modifier}+w" = "exec makoctl dismiss";
        # Apps
        ###
        # brightness
        "XF86MonBrightnessDown" = "exec lightctl -";
        "XF86MonBrightnessUp" = "exec lightctl +";
        "XF86KbdBrightnessDOwn" = "exec lightctl -D smc::kbd_backlight -";
        "XF86KbdBrightnessUp" = "exec lightctl -D smc::kbd_backlight +";

        "XF86AudioRaiseVolume" = "exec volumectl +";
        "XF86AudioLowerVolume" = "exec volumectl -";
        "XF86AudioMute" = "exec volumectl %";

        # grimshot
        "${cfg.modifier}+m" = "exec grimshot save output";
        "${cfg.modifier}+Shift+m" = "exec grimshot save active";
        "${cfg.modifier}+Mod1+m" = "exec grimshot save area";
        "${cfg.modifier}+Ctrl+m" = "exec grimshot save window";

        # mylock
        "${cfg.modifier}+l" =
          "exec ${config.home.homeDirectory}/.local/bin/mylock";
        "${cfg.modifier}+Shift+l" =
          "exec ${config.home.homeDirectory}/.local/bin/mylock at-home-mode";
        "${cfg.modifier}+Ctrl+l" =
          "exec ${config.home.homeDirectory}/.local/bin/mylock safe-mode";
        "${cfg.modifier}+Shift+Ctrl+l" =
          "exec ${config.home.homeDirectory}/.local/bin/mylock lock-now";
      };
      menu = "\${pkgs.wofi}/bin/wofi --show drun";
      modifier = "Mod4";
      #output = {
      #  "*" = { bg = "${config.xdg.configHome}/wallpaper/wall-03.png fill"; };
      #};
      seat = {
        "*" = {
          xcursor_theme = "${config.gtk.cursorTheme.name}";
          hide_cursor = "when-typing 10";
        };
      };
      startup = [
        {
          command = "configure-gtk";
          always = true;
        }
        {
          command = "wl-paste --watch cliphist store";
        }
        #{ command = "avizo-service"; }
        #{ command = "nm-applet --indicator"; }
        { command = "wpaperd"; }
        { command = "swayfader"; }
      ];
      terminal = "kitty";
      window = { border = 1; };
      workspaceAutoBackAndForth = true;

    };
    extraConfig = ''
      for_window [app_id="org.qutebrowser.qutebrowser"] inhibit_idle fullscreen
      for_window [app_id="firefox"] inhibit_idle fullscreen

    '';
    systemdIntegration = true;
  };
}
