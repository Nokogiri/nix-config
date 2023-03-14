{
  imports = [ ./esphome.nix ./homeassistant.nix ];
  virtualisation.oci-containers.backend = "podman";
}
