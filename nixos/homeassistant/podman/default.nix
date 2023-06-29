{
  imports = [
    # ./anisette-alt.nix
    ./calibre-web.nix
    ./esphome.nix
    ./homeassistant.nix
    ./pihole.nix
  ];
  virtualisation.oci-containers.backend = "podman";
}
