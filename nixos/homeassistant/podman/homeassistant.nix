{
  virtualisation.oci-containers.containers = {
    homeassistant = {
      image = "ghcr.io/home-assistant/home-assistant:stable";
      autoStart = true;
      volumes = [
        "/var/lib/pods/homeassistant/config:/config"
        "/etc/localtime:/etc/localtime:ro"
      ];
      environment = {
        TZ = "Europe/Berlin";
        PUID = "1000";
        PGID = "1000";
      };
      extraOptions = [ "--network=host" ];
    };
  };
}
