{ pkgs, ... }: {
  virtualisation.oci-containers.backend = "podman";
  virtualisation.podman = {
    enable = true;
    extraPackages = [ pkgs.zfs ];
  };
}
