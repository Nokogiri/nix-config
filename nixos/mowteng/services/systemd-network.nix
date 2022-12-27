{
  systemd.network.networks."21-wireless" = {
    matchConfig.Name = [ "wl*" ];
    DHCP = "ipv4";
  };
}
