{ pkgs, ... }: {
  home.packages = with pkgs; [
    wine
    #wineWowPackages.staging
    winetricks
  ];
}
