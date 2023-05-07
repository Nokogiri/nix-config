{
  imports = [
    ../../common/optional/systemd-network.nix
    ../../common/optional/wireless-iwd.nix  
  ];
  networking.useDHCP = false;
  
  systemd.network.networks."20-wlan" = {
    matchConfig.Name = [ "wl*" ];
    DHCP = "yes";
    #extraConfig = ''
    #  MulticastDNS=true
    #'';
  };
}
