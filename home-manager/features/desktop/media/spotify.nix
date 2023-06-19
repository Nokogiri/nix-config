{ pkgs, lib, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {

  imports = [ inputs.spicetify-nix.homeManagerModule ];

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
