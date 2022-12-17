{ pkgs, inputs, config, ... }: {
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      colloid-icon-theme =
        colloid-icon-theme.override { colorVariants = [ "teal" ]; };
    };
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
      package = pkgs.colloid-cursors;
      name = "Colloid-dark-Cursors";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    iconTheme = {
      package = pkgs.colloid-icon-theme;
      name = "Colloid-teal-dark";
    };
    theme = {
      package = pkgs.catppuccin-gtk-frappe-teal;
      name = "Catppuccin-Frappe-Teal";
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
