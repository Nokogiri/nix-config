{ inputs, outputs, lib, pkgs, config, ... }: {
  imports = [ inputs.nix-colors.homeManagerModule ../features/cli ];

  colorScheme = inputs.nix-colors.lib-core.schemeFromYAML "cool-scheme"
    (builtins.readFile ./frappe.yaml);
}
