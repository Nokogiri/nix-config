{ inputs, outputs, lib, pkgs, config, ... }: {
  imports = [ ../features/cli ];

  colorScheme = inputs.nix-colors.lib-core.schemeFromYAML "catppuccin-frappe"
    (builtins.readFile ./frappe.yaml);

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = true;
  };
}
