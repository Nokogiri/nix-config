{
  systemd.network.networks."20-wired" = {
      matchConfig.Name = [ "en*" ];
      DHCP = "no";
      address = [ "192.168.178.57" ];
      gateway = [ "192.168.178.1" ];
      dns = [ "192.168.178.254" ];
      #dhcpV4Config = {
      #  RouteMetric = 10;
      #  UseDNS = true;
      #  UseRoutes = true;
      #};
    };
}
