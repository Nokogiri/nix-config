{
  virtualisation.oci-containers.containers = {
    calibre-web = {
      image = "ghcr.io/linuxserver/calibre-web";
      autoStart = true;
      volumes = [
        "/var/lib/pods/calibre-web/calibre-data:/config"
        "/var/lib/pods/calibre-web/books:/books"
      ];
      environment = {
        TZ = "Europe/Berlin";
        DOCKER_MODS = "linuxserver/mods:universal-calibre";
        PUID = "1000";
        PGID = "1000";
      };
      ports = [ "10.200.200.1:8083:8083/tcp" ];
    };
  };
}
