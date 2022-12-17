{ inputs, pgks, ... }: {
  imports = [
    ./global
    ./features/desktop/common
    ./features/desktop/sway
    ./features/desktop/wireless
    inputs.spicetify-nix.homeManagerModule
  ];

}
