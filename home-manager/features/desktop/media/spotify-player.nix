{ pkgs, ... }: {
  home.packages = [
    pkgs.spotify-player
    (pkgs.writeShellScriptBin "Spoty_Player" ''
      kitty --class Spotify ${pkgs.spotify-player}/bin/spotify_player
    '')
  ];

}
