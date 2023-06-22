{ pkgs, inputs, config, ... }:
let
  gTheme = "Catppuccin-Frappe-Standard-Lavender-dark";
  gAccent = "lavender";
  gFlavor = "frappe";
  kAccent = "Lavender";
  kFlavor = "Frappe";
in {
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
    (catppuccin-gtk.override {
      accents = [ gAccent ];
      variant = gFlavor;
      size = "standard";
      tweaks = [ "rimless" ];
    })
    (catppuccin-kvantum.override {
      accent = kAccent;
      variant = kFlavor;
    })
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  qt.style.name = "Kvantum-Dark";

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = gAccent;
        flavor = gFlavor;
      };
    };
    theme = { name = "Catppuccin-Frappe-Standard-Lavender-dark"; };

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
        gtk-button-images = true;
        gtk-menu-images = true;
        gtk-enable-event-sounds = false;
        gtk-enable-animations = true;
        gtk-application-prefer-dark-theme = true;

      };
    };
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    size = 32;
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    x11.defaultCursor = "left_ptr";
  };

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';
}
