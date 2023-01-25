{ pkgs, inputs, config, ... }: {
  home.packages = with pkgs;
    [
      (pkgs.writeTextFile {
        name = "configure-gtk";
        destination = "/bin/configure-gtk";
        executable = true;
        text = let
          schema = pkgs.gsettings-desktop-schemas;
          datadir = "${schema}/share/gsettings-schemas/${schema.name}";
        in ''
          export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
          gnome_schema=org.gnome.desktop.interface
          gsettings set $gnome_schema gtk-theme '${config.gtk.theme.name}'
          gsettings set $gnome_schema icon-theme '${config.gtk.iconTheme.name}'
          gsettings set $gnome_schema cursor-theme '${config.gtk.cursorTheme.name}'
        '';
      })
    ];

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.catppuccin-cursors.frappeSky;
      name = "Catppuccin-Frappe-Sky-Cursors";
    };
    font = {
      name = "CaskaydiaCove Nerd Font SemiLight";
      size = 12;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme.override { color = "teal"; };
      name = "Papirus-Dark";
    };
    theme = {
      name = "Catppuccin-Frappe-Compact-Sky-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "sky" ];
        variant = "frappe";
        tweaks = [ "rimless" ];
        size = "compact";
      };
    };
    gtk2 = {
      extraConfig = ''
        gtk-toolbar-style=GTK_TOOLBAR_ICONS
        gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images=0
        gtk-menu-images=0
      '';
    };
    gtk3 = {
      extraConfig = {
        gtk-button-images = false;
        gtk-menu-images = false;
        gtk-enable-event-sounds = false;
        gtk-enable-animations = true;
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
