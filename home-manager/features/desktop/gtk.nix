{ pkgs, inputs, config, ... }: {
  home.packages = with pkgs; [
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
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  qt.style.name = "kvantum-dark";
  qt.style.package = "libsForQt5.qtstyleplugin-kvantum";

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.catppuccin-cursors.macchiatoDark;
      name = "Catppuccin-Macchiato-Dark-Cursors";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "mauve";
        flavor = "mocha";
      };
    };
    theme = { name = "Catppuccin-Mocha-Standard-Mauve-Dark"; };
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
        gtk-application-prefer-dark-theme = false;
      };
    };
  };

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';
}
