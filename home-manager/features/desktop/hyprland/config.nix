{ lib, config, inputs, ... }: {
  wayland.windowManager.hyprland = {
    extraConfig = ''
        general {
          #main_mod=SUPER
          gaps_in=15
          gaps_out=20
          border_size=3.7
          col.active_border=0xffAAAAAA
          col.inactive_border=0xff666666
          no_cursor_warps=true
          #cursor_inactive_timeout=4
        }

        monitor=eDP-1,preferred,auto,1
        decoration {
          active_opacity=1.0
          inactive_opacity=0.9
          fullscreen_opacity=1.0
          rounding=8
          blur=true
          blur_size=3
          blur_passes=1
          blur_new_optimizations=true
          blur_ignore_opacity=true
          drop_shadow=true
          shadow_range=12
          shadow_offset=3 3
          col.shadow=0x44000000
          col.shadow_inactive=0x66000000
        }

        animations {
          enabled=true

          bezier=easein,0.11, 0, 0.5, 0
          bezier=easeout,0.5, 1, 0.89, 1
          bezier=easeinout,0.45, 0, 0.55, 1

          animation=windowsIn,1,3,easeout,slide
          animation=windowsOut,1,3,easein,slide
          animation=windowsMove,1,3,easeout

          animation=fadeIn,1,3,easeout
          animation=fadeOut,1,3,easein
          animation=fadeSwitch,1,3,easeout
          animation=fadeShadow,1,3,easeout
          animation=fadeDim,1,3,easeout
          animation=border,1,3,easeout

          animation=workspaces,1,2,easeout,slide
        }

        #dwindle {
        #  col.group_border_active=0xffEEEEEE
          #col.group_border=0xff999999
        #  split_width_multiplier=1.35
        #}

        misc {
          disable_hyprland_logo=true
          disable_splash_rendering=true
          vfr=true
          
        }

        debug {
          overlay=false
        }
        binds {
          workspace_back_and_forth = true
        }
        input {
          kb_layout=us
          touchpad {
            disable_while_typing=true
          }
          touchdevice {
            output=eDP-1
          }
      #    tablet {
      #      output=eDP-1
      #    }
        }

        device:wacom-hid-49c8-finger {
            output=eDP-1
            enabled=true
        }
        device:wacom-hid-49c8-pen {
          output=eDP-1
          enabled=true
        }


        # Startup
        exec-once=~/.nix-profile/libexec/polkit-kde-authentication-agent-1
        #exec=swaybg -i /home/nokogiri/.config/wallpaper/wall-05.png --mode fill
        #exec-once=swww init
        #exec-once=swww img ~/.local/share/wallpaper/Totoro.webp --transition-step 128 --transition-fps 60 --transition-type outer --transition-pos top-left
        exec-once=~/.local/bin/swwwi
        exec-once=mako
        exec-once=swayidle -w
        exec-once=wl-paste --watch cliphist store
        #exec-once=hyprpaper

        # Mouse binding
        bindm=SUPER,mouse:272,movewindow
        bindm=SUPER,mouse:273,resizewindow

        # Program bindings
        bind=SUPER,Return,exec,kitty
        bind=SUPER,w,exec,makoctl dismiss
        bind=SUPER,v,exec,$TERMINAL $SHELL -ic nvim
        bind=SUPER,m,exec,$TERMINAL $SHELL -ic neomutt
        bind=SUPER,b,exec,firefox

        bind=SUPER,p,exec,wofi -S drun -x 10 -y 10 -W 25% -H 60%
        bind=SUPER,d,exec,hyprfuzzel
        bind=SUPER,i,exec,cliphist list | fuzzel -d -w 96 | cliphist decode | wl-copy
        bind=,Scroll_Lock,exec,pass-wofi # fn+k
        bind=,XF86Calculator,exec,pass-wofi # fn+f12

        # Toggle waybar
        bind=,XF86Tools,exec,pkill -USR1 waybar # profile button

        # Lock screen
        bind=,XF86Launch5,exec,swaylock -S
        bind=,XF86Launch4,exec,swaylock -S

        # Screenshots
        bind=,Print,exec,grimblast --notify copy output
        bind=SHIFT,Print,exec,grimblast --notify copy active
        bind=CONTROL,Print,exec,grimblast --notify copy screen
        bind=SUPER,Print,exec,grimblast --notify copy window
        bind=ALT,Print,exec,grimblast --notify copy area

        # Keyboard controls (brightness, media, sound, etc)
        bind=,XF86MonBrightnessUp,exec,lightctl +
        bind=,XF86MonBrightnessDown,exec,lightctl -

        bind=ALT,XF86AudioRaiseVolume,exec,playerctl next
        bind=ALT,XF86AudioLowerVolume,exec,playerctl previous
        bind=,XF86AudioPlay,exec,playerctl play-pause
        bind=,XF86AudioStop,exec,playerctl stop
        bind=ALT,XF86AudioNext,exec,playerctld shift
        bind=ALT,XF86AudioPrev,exec,playerctld unshift
        bind=ALT,XF86AudioPlay,exec,systemctl --user restart playerctld
        bind=SUPER,XF86AudioPlay,exec,$TERMINAL $SHELL -ic lyrics

        bind=,XF86AudioRaiseVolume,exec,volumectl +
        bind=,XF86AudioLowerVolume,exec,volumectl -
        bind=,XF86AudioMute,exec,volumectl %

        bind=SHIFT,XF86AudioMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle
        bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle


        # Window manager controls
        bind=SUPERSHIFT,q,killactive
        bind=SUPERSHIFT,e,exit

        bind=SUPER,s,togglesplit
        bind=SUPER,f,fullscreen,1
        bind=SUPERSHIFT,f,fullscreen,0
        bind=SUPERSHIFT,space,togglefloating

        bind=SUPER,minus,splitratio,-0.25
        bind=SUPERSHIFT,minus,splitratio,-0.3333333

        bind=SUPER,equal,splitratio,0.25
        bind=SUPERSHIFT,equal,splitratio,0.3333333

        bind=SUPER,g,togglegroup
        bind=SUPER,apostrophe,changegroupactive,f
        bind=SUPERSHIFT,apostrophe,changegroupactive,b

        bind=SUPER,left,movefocus,l
        bind=SUPER,right,movefocus,r
        bind=SUPER,up,movefocus,u
        bind=SUPER,down,movefocus,d
        bind=SUPER,h,movefocus,l
        bind=SUPER,l,movefocus,r
        bind=SUPER,k,movefocus,u
        bind=SUPER,j,movefocus,d

        bind=SUPERSHIFT,left,movewindow,l
        bind=SUPERSHIFT,right,movewindow,r
        bind=SUPERSHIFT,up,movewindow,u
        bind=SUPERSHIFT,down,movewindow,d
        bind=SUPERSHIFT,h,movewindow,l
        bind=SUPERSHIFT,l,movewindow,r
        bind=SUPERSHIFT,k,movewindow,u
        bind=SUPERSHIFT,j,movewindow,d

        bind=SUPERCONTROL,left,focusmonitor,l
        bind=SUPERCONTROL,right,focusmonitor,r
        bind=SUPERCONTROL,up,focusmonitor,u
        bind=SUPERCONTROL,down,focusmonitor,d
        bind=SUPERCONTROL,h,focusmonitor,l
        bind=SUPERCONTROL,l,focusmonitor,r
        bind=SUPERCONTROL,k,focusmonitor,u
        bind=SUPERCONTROL,j,focusmonitor,d

        bind=SUPERCONTROL,1,focusmonitor,DP-1
        bind=SUPERCONTROL,2,focusmonitor,DP-2
        bind=SUPERCONTROL,3,focusmonitor,DP-3

        bind=SUPERCONTROLSHIFT,left,movewindow,mon:l
        bind=SUPERCONTROLSHIFT,right,movewindow,mon:r
        bind=SUPERCONTROLSHIFT,up,movewindow,mon:u
        bind=SUPERCONTROLSHIFT,down,movewindow,mon:d
        bind=SUPERCONTROLSHIFT,h,movewindow,mon:l
        bind=SUPERCONTROLSHIFT,l,movewindow,mon:r
        bind=SUPERCONTROLSHIFT,k,movewindow,mon:u
        bind=SUPERCONTROLSHIFT,j,movewindow,mon:d

        bind=SUPERCONTROLSHIFT,1,movewindow,mon:DP-1
        bind=SUPERCONTROLSHIFT,2,movewindow,mon:DP-2
        bind=SUPERCONTROLSHIFT,3,movewindow,mon:DP-3

        bind=SUPERALT,left,movecurrentworkspacetomonitor,l
        bind=SUPERALT,right,movecurrentworkspacetomonitor,r
        bind=SUPERALT,up,movecurrentworkspacetomonitor,u
        bind=SUPERALT,down,movecurrentworkspacetomonitor,d
        bind=SUPERALT,h,movecurrentworkspacetomonitor,l
        bind=SUPERALT,l,movecurrentworkspacetomonitor,r
        bind=SUPERALT,k,movecurrentworkspacetomonitor,u
        bind=SUPERALT,j,movecurrentworkspacetomonitor,d

        bind=SUPER,u,togglespecialworkspace
        bind=SUPERSHIFT,u,movetoworkspace,special

        bind=SUPER,1,workspace,01
        bind=SUPER,2,workspace,02
        bind=SUPER,3,workspace,03
        bind=SUPER,4,workspace,04
        bind=SUPER,5,workspace,05
        bind=SUPER,6,workspace,06
        bind=SUPER,7,workspace,07
        bind=SUPER,8,workspace,08
        bind=SUPER,9,workspace,09

        bind=SUPERSHIFT,1,movetoworkspacesilent,01
        bind=SUPERSHIFT,2,movetoworkspacesilent,02
        bind=SUPERSHIFT,3,movetoworkspacesilent,03
        bind=SUPERSHIFT,4,movetoworkspacesilent,04
        bind=SUPERSHIFT,5,movetoworkspacesilent,05
        bind=SUPERSHIFT,6,movetoworkspacesilent,06
        bind=SUPERSHIFT,7,movetoworkspacesilent,07
        bind=SUPERSHIFT,8,movetoworkspacesilent,08
        bind=SUPERSHIFT,9,movetoworkspacesilent,09

        windowrulev2 = workspace 3 silent,class:^(mpv)$
        windowrulev2 = workspace 6 silent,class:^(Steam)$
        windowrulev2 = dimaround,class:^(mpv)$
        #windowrulev2 = fullscreen,opaque,noblur,forceinput,class:^(.gamescope-wrapped)$
        windowrulev2 = workspace 7 silent,class:^(Spotify)$
        windowrulev2 = fullscreen,opaque,noblur,class:^(.org.jellyfin.)$
        blurls=waybar
    '';
  };
}
