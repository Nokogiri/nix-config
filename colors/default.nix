{ inputs, outputs, lib, pkgs, config, ... }: {

  colorScheme = inputs.nix-colors.lib-core.schemeFromYAML "catppuccin-macchiato"
    (builtins.readFile ./macchiato.yaml);
}
