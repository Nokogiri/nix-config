{ pkgs, lib, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {

  imports = [ inputs.spicetify-nix.homeManagerModule ];

  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "SpotifyWM";
      exec = "spotify";
      icon = "spotify";
      terminal = false;
    };
  };
  programs.spicetify = {
    windowManagerPatch = true;
    enable = true;
    theme = spicePkgs.themes.catppuccin-frappe;
    colorScheme = "lavender";
    enabledCustomApps = with spicePkgs.apps; [ lyrics-plus ];
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      popupLyrics
      hidePodcasts
      fullAppDisplayMod
    ];
  };
}
