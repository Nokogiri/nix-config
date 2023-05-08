{
  imports = [
    ../../common/optional/systemd-network.nix
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
      MACAddress = "42:3d:f9:ea:a9:e4";
      Name = "br0";
      Kind = "bridge";
      };
  };
  systemd.network.networks."10_bind" = {
    matchConfig.Name = [ "en*" ];
    bridge = [ "br0" ];
  };
  systemd.network.networks."qbridge" = {
    matchConfig.Name = [ "br0" ];
    DHCP = "no";
    address = [ "192.168.178.57/24" ];
    gateway = [ "192.168.178.1" ];
    dns = [ "192.168.178.254" ];
    extraConfig = ''
      IPv6AcceptRA=no
      LinkLocalAddressing=ipv4
      MulticastDNS = "yes";
    '';
  };
}
