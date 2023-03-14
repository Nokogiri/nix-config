{
  imports = [ ./esphome.nix ./homeassistant.nix ./pihole.nix ];
  virtualisation.oci-containers.backend = "podman";
}
