{ config, lib, pkgs, ... }:
let cfg = config.xsession.windowManager.i3.config;
in {
  xsession.windowManager.i3.config = {
    assigns = { "1" = [{ class = "kitty"; }]; };
    focus = {
      followMouse = true;
      newWindow = "smart";
      wrapping = "workspace";
    };
    fonts = {
      names = [ "FiraCode Nerd Font" ];
      style = "Regular";
      size = 11.0;
    };
    gaps = {
      inner = 3;
      outer = 6;
      smartBorders = "no_gaps";
      smartGaps = true;
    };
    keybindings = {
      "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
      "${cfg.modifier}+p" = "exec wofi --show drun";

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
    };
    menu = "${pkgs.rofi}/bin/rofi -show drun";
    modifier = "Mod4";
    startup = [{ command = "xsetroot -cursor_name left_ptr"; }];
    terminal = "kitty";
    window = { border = 1; };
    workspaceAutoBackAndForth = true;
  };
}
