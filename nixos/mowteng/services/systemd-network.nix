{
  imports = [
    ../../common/optional/systemd-network.nix
    ../../common/optional/wireless-iwd.nix  
  ];
  networking.useDHCP = false;
  
  systemd.network.networks."20-wlan" = {
    matchConfig.Name = [ "wl*" ];
    DHCP = "yes";
    dns = [ "192.168.178.254" ];
    extraConfig = ''
      LinkLocalAddressing=ipv4
      IPv6AcceptRA=no
      MulticastDNS=true
    '';
  };
}
