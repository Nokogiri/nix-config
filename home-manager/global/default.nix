{ inputs, outputs, lib, pkgs, config, ... }: {
  imports = [ ../features/cli ];

  colorScheme = inputs.nix-colors.lib-core.schemeFromYAML "catppuccin-frappe"
    (builtins.readFile ./frappe.yaml);
}
