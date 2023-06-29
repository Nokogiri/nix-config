{ pkgs, ... }: {

  imports = [ ./spotify.nix ];
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      mpv = mpv.override {
        scripts = [ pkgs.mpvScripts.mpris pkgs.mpvScripts.sponsorblock ];
      };
    };
  home.packages = with pkgs; [ ani-cli jellyfin-media-player mpv ];

  xdg.desktopEntries."umpv" = {
    exec = "";
    name = "umpv";
    settings.NoDisplay = "true";
  };
  xdg.desktopEntries."com.github.iwalton3.jellyfin-media-player" = {
    exec =
      "env env QT_WAYLAND_DISABLE_WINDOWDECORATION=0 ${pkgs.jellyfin-media-player}/bin/jellyfinmediaplayer";
    name = "Jellyfin Media Player";
    icon = "com.github.iwalton3.jellyfin-media-player";
    terminal = false;
    categories = [ "AudioVideo" "Video" "Player" "TV" ];
    comment = "Desktop client for Jellyfin";
  };
}
