{ pkgs, config, ... }: {
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    plugins = {
      src = (pkgs.fetchFromGitHub {
        owner = "Nokogiri";
        repo = "nnn";
        rev = "d3e246768100c2b004829b3d849efd1f2004a9cb"; # 01.04.2023
        sha256 = "sha256-ACxG+U6PzsyriP/GJwZ95eYHAT2CeV28Il56W9K4AbY=";
      }) + "/plugins";
      mappings = { p = "preview-tui"; };
    };
  };
  home.sessionVariables = {
    NNN_PREVIEWDIR =
      "${config.home.sessionVariables.XDG_CACHE_HOME}/nnn/previews";
    NNN_ICONLOOKUP = 1;
    #BAT_THEME = "Catppuccin-frappe";
  };
}
