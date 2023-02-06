{ pkgs, config, ... }: {
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    plugins = {
      src = (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "70204a2d0fccd96264e0a6a66ab22e58f5ccafa5"; #04.02.2023
        sha256 = "sha256-XVPcA8odPdyBoS7p+uZvg8nTtmcpJyVZXRIPzLlxXVY=";
      }) + "/plugins";
      mappings = {
        p = "preview-tui";
      };
    };
  };
  home.sessionVariables = {
    NNN_PREVIEWDIR = "${config.home.sessionVariables.XDG_CACHE_HOME}/nnn/previews";
    BAT_THEME = "Catppuccin-frappe";
  };
}
