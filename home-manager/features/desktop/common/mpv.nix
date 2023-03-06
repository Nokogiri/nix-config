{ pkgs, ... }: {

  #nixpkgs.config.packageOverrides = pkgs:
  #  with pkgs; {
  #    mpv = mpv.override { scripts = [ pkgs.mpvScripts.mpris ]; };
  #  };

  home.packages = with pkgs; [ mpv celluloid ];

  xdg.desktopEntries."umpv" = {
    exec = "";
    name = "umpv";
    settings.NoDisplay = "true";
  };

}
