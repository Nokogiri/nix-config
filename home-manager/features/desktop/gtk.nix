{ pkgs, inputs, config, ... }:
let
  gTheme = "Catppuccin-Mocha-Standard-Rosewater-Dark";
  gAccent = "teal";
  gFlavor = "mocha";
  kAccent = "Rosewater";
  kFlavor = "Mocha";
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
    adwaita-qt
    adwaita-qt6
    libsForQt5.qt5ct
  ];

  qt.style.name = "Adwaita-Dark";

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
        accent = gAccent;
        flavor = gFlavor;
      };
    };
    theme = { name = "Adwaita"; };#package = pkgs.adw-gtk3; };
    #theme = { name = "adw-gtk3-dark"; package = pkgs.adw-gtk3; };
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
    name = "Catppuccin-Macchiato-Dark-Cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    x11.defaultCursor = "left_ptr";
  };

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';
}
