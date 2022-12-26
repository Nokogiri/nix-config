{
  systemd.network.networks."20-wired" = {
      matchConfig.Name = [ "en*" ];
      DHCP = "yes";
      dhcpV4Config = {
        RouteMetric = 10;
        UseDNS = true;
        UseRoutes = true;
      };
    };
}
