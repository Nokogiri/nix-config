{ pkgs, inputs, config, ... }:
let
  catTheme = "Catppuccin-Frappe-Standard-Lavender-dark";
  catppuccin-gt = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "rimless" ];
    variant = "frappe";
  };
  catppuccin-icons = pkgs.catppuccin-papirus-folders.override {
    accent = "lavender";
    flavor = "frappe";
  };
  catppuccin-qt = pkgs.catppuccin-kvantum.override {
    accent = "Lavender";
    variant = "Frappe";
  };
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
    catppuccin-gt
    catppuccin-qt
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
      package = catppuccin-icons;
    };
    theme = {
      name = catTheme;
      package = catppuccin-gt;
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
        gtk-button-images = true;
        gtk-menu-images = true;
        gtk-enable-event-sounds = false;
        gtk-enable-animations = true;
        gtk-application-prefer-dark-theme = true;

      };
    };
  };
  home.file.".config/gtk-4.0/gtk.css".source =
    "${catppuccin-gt}/share/themes/Catppuccin-Frappe-Standard-Lavender-dark/gtk-4.0/gtk.css";
  home.file.".config/gtk-4.0/gtk-dark.css".source =
    "${catppuccin-gt}/share/themes/Catppuccin-Frappe-Standard-Lavender-dark/gtk-4.0/gtk-dark.css";
  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source =
      "${catppuccin-gt}/share/themes/Catppuccin-Frappe-Standard-Lavender-dark/gtk-4.0/assets";
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
