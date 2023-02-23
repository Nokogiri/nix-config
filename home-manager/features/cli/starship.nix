{ pkgs, ... }: {
  programs.starship = let
    flavour = "macchiato"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
  in {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = "$all";
      add_newline = false;
      character = {
        success_symbol = "[[♥](green) ❯](maroon)";
        error_symbol = "[❯](red)";
        vicmd_symbol = "[❮](green)";
      };
      battery = { disabled = true; };
      palette = "catppuccin_${flavour}";
    } // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "starship";
      rev = "3e3e54410c3189053f4da7a7043261361a1ed1bc";
      sha256 = "sha256-soEBVlq3ULeiZFAdQYMRFuswIIhI9bclIU8WXjxd7oY=";
    } + /palettes/${flavour}.toml));
  };
}
