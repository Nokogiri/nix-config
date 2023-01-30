{ pkgs, ... }: {
  home.packages = with pkgs; [ wineWowPackages.stableFull winetricks ];
}
