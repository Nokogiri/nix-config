{
  systemd.network.networks."20-wired" = {
    matchConfig.Name = [ "en*" ];
    DHCP = "ipv6";
    address = [ "192.168.178.57" ];
    gateway = [ "192.168.178.1" ];
    dns = [ "192.168.178.254" ];
  };
}
