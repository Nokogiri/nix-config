{ inputs, config, ... }:
let hyprplugs = inputs.hyprplugs.packages."x86_64-linux";
in {
  home.packages = with hyprplugs; [ hyprfocus ];
  xdg.configFile."hypr/plugins.conf".text = ''
    plugin = ${hyprplugs.hyprfocus}/lib/libhyprfocus.so
    plugin:hyprfocus {
      enabled = yes

      keyboard_focus_animation = flash
      mouse_focus_animation = flash

      bezier = bezIn, 0.05,0.9,0.1,1.05
      bezier = bezOut, 0.05,0.9,0.1,1.05

      flash {
          flash_opacity = 0.6

          in_bezier = bezIn
          in_speed = 2.5

          out_bezier = bezOut
          out_speed = 2.5
      }

      shrink {
          shrink_percentage = 0.8

          in_bezier = bezIn
          in_speed = 0.5

          out_bezier = bezOut
          out_speed = 3
      }
    }
  '';
}
