{ pkgs, ... }: {
  home.packages = with pkgs; [
    #wine
    wineWowPackages.stable
    #wineWowPackages.staging
    winetricks
  ];
}
