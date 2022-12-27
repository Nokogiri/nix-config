{
  systemd.network.networks."21-wireless" = {
    matchConfig.Name = [ "wl*" ];
    DHCP = "yes";
    networkConfig = {
      MulticastDNS = false;
      LLMNR = false;
    };
  };
}
