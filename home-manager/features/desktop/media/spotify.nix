{ pkgs, lib, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [ inputs.spicetify-nix.homeManagerModule ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Nord;
    colorScheme = "sky";
    enabledCustomApps = with spicePkgs.apps; [ marketplace lyrics-plus ];
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      hidePodcasts
      fullAppDisplay
    ];
  };
}
