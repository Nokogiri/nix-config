{ inputs, pgks, ... }: {
  imports = [
    ./global
    ./features/desktop/common
    inputs.spicetify-nix.homeManagerModule
  ];

}
