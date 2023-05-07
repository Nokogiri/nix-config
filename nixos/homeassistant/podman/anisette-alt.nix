{
  virtualisation.oci-containers.containers = {
    anisette-alt = {
      image = "nyamisty/alt_anisette_server";
      autoStart = true;
      #volumes = [
      ##  "/var/lib/volumes/esphome/config:/config"
      #  "/var/lib/volumes/esphome/cache:/cache"
      #  "/etc/localtime:/etc/localtime:ro"
      #];
      extraOptions = [ "--network=host" ];
    };
  };
}
