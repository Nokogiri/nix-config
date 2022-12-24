{ pkgs, lib, inputs, ... }:
#let spicePkgs = spicetify-nix.pkgSets.${pkgs.system};
let spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {

  home.packages = [
    pkgs.spotifywm
  ];
  programs.spicetify = {
    enable = true;
    #theme = "catppuccin-frappe";
    # OR 
    theme = spicePkgs.themes.catppuccin-frappe;
    colorScheme = "teal";

    #enabledCustomApps = with spicetify-nix.pkgSets.${pkgs.system}.apps; [ lyrics-plus ];
    enabledCustomApps = with spicePkgs.apps; [ marketplace lyrics-plus ];
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      hidePodcasts
      fullAppDisplay
    ];
  };
}
