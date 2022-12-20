{ pkgs, ... }: {
  home.packages = with pkgs; [ gtk-pipe-viewer ];

  xdg.desktopEntries."gtk-pipe-viewer" = {
    exec = "gtk-pipe-viewer";
    name = "GTK Pipe Viewer";
    icon = "mpv";
  };
}
