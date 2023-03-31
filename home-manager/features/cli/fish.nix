{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    functions = { fish_greeting = ""; };
    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "63c8f8e65761295da51029c5b6c9e601571837a1";
          sha256 = "i9FcuQdmNlJnMWQp7myF3N0tMD/2I0CaMs/PlD8o1gw=";
        };
      }
      {
        name = "catppuccin";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "fish";
          rev = "b90966686068b5ebc9f80e5b90fdf8c02ee7a0ba";
          sha256 = "wQlYQyqklU/79K2OXRZXg5LvuIugK7vhHgpahpLFaOw=";
        };
      }
    ];
    shellAbbrs = {

      ipa = "ip -color -brief a";
      ls = "exa";
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild --flake . switch";
      snr = "doas nixos-rebuild --flake .";
      snrs = "doas nixos-rebuild --flake . switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";

    };
    shellAliases = {
      # Get ip
      getip = "curl ifconfig.me";
      # SSH with kitty terminfo
      kssh = "kitty +kitten ssh";
      # Clear screen and scrollback
      clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
    };
    interactiveShellInit = ''
      set --global KITTY_INSTALLATION_DIR "${pkgs.kitty}/lib/kitty"
      set --global KITTY_SHELL_INTEGRATION enabled
      source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
      set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
    '';
  };
}
