{ pkgs, ... }: {

  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      mpv = mpv.override {
        scripts = [
          pkgs.mpvScripts.mpris
          pkgs.mpvScripts.sponsorblock
          pkgs.mpvScripts.simple-mpv-webui
        ];
      };
    };
  home.packages = with pkgs; [ jellyfin-media-player mpv spotify-player ];

  xdg.desktopEntries."umpv" = {
    exec = "";
    name = "umpv";
    settings.NoDisplay = "true";
  };
}
