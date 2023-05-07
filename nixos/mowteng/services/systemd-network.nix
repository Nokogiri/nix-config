{
  imports = [
    ../../common/optional/systemd-network.nix
    ../../common/optional/wireless-iwd.nix  
  ];
  networking.useDHCP = false;
  #systemd.network.networks."20-wired" = {
  #  matchConfig.Name = [ "en*" ];
  #  DHCP = "no";
  #  address = [ "192.168.178.56" ];
  #  gateway = [ "192.168.178.1" ];
  #  dns = [ "192.168.178.254" ];
  #};
  systemd.network.netdevs."qbridge" = {
    netdevConfig = {
      MACAddress = "2c:33:58:a5:cb:f7";
      Name = "br0";
      Kind = "bridge";
      };
  };
  systemd.network.networks."10_bind" = {
    matchConfig.Name = [ "wl*" ];
    bridge = [ "br0" ];
  };
  systemd.network.networks."qbridge" = {
    matchConfig.Name = [ "br0" ];
    DHCP = "yes";
    #address = [ "192.168.178.57/24" ];
    #gateway = [ "192.168.178.1" ];
    #dns = [ "192.168.178.254" ];
    extraConfig = ''
      MulticastDNS = "yes";
    '';
  };
}
