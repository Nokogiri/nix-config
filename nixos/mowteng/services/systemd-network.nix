{
  systemd.network.networks = {
  #"20-wireless-home" = {
    #matchConfig.Name = [ "wl*" ];
  #  matchConfig.SSID = [ "(=^--^=)" ];
  #  DHCP = "no";
  #  address = [ "192.168.178.3/24" ];
  #  gateway = [ "192.168.178.1" ];
  #  dns = [ "192.168.178.254" ];
  #  networkConfig = {
  #    MulticastDNS = false;
  #    LLMNR = false;
  #  };
  #};
  
  "21-wireless-outside" = {
    matchConfig.Name = [ "wl*" ];
    DHCP = "ipv4";
    dhcpV4Config = {
      UseDNS = true;
      UseRoutes = true;
    };
    networkConfig = {
      LinkLocalAddressing = "no";
      MulticastDNS = false;
      LLMNR = false;
    };
  };
  };
}
