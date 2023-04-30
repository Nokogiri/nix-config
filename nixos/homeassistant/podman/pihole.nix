{
  sops.secrets.pihole = { };
  virtualisation.oci-containers.containers = {
    pihole = {
      image = "pihole/pihole:latest";
      autoStart = true;
      volumes = [
        "/var/lib/pods/pihole/etc-pihole:/etc/pihole"
        "/var/lib/pods/pihole/etc-dnsmasq.d:/etc/dnsamsq.d"
        #"/etc/localtime:/etc/localtime:ro"
      ];
      environment = { TZ = "Europe/Berlin"; };
      environmentFiles = [ /run/secrets/pihole ];
      ports = [
        "10.200.200.1:53:53/tcp"
        "10.200.200.1:53:53/udp"
        "10.200.200.1:67:67/udp"
        "10.200.200.1:88:80/tcp"
        "10.200.200.1:1543:443/tcp"
      ];
      extraOptions = [
        #"--network=host"
        "--cap-add=net_admin"
      ];
    };
  };
}
