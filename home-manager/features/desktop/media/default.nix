{ pkgs, ... }: { 

  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      mpv = mpv.override { scripts = [ pkgs.mpvScripts.mpris ]; };
    };
  home.packages = with pkgs; [ 
    jellyfin-media-player
    mpv
    ];
  
  xdg.desktopEntries."umpv" = {
    exec = "";
    name = "umpv";
    settings.NoDisplay = "true";
  };
}
