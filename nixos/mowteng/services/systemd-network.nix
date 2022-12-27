{
  systemd.network.networks."21-wireless" = {
    matchConfig.Name = [ "wl*" ];
    DHCP = "yes";
    dhcpV4Config = {
      UseDNS = true;
      UseRoutes = true;
    };
    networkConfig = {
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}
