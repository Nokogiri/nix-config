{ config, ... }:{
  imports = [
    ../../common/optional/systemd-network.nix
    ../../common/optional/wireless-iwd.nix  
  ];
  networking.useDHCP = false;

  # wlan0
  systemd.network.networks = {
    "20-wlan" = {
        matchConfig.Name = [ "wl*" ];
        DHCP = "yes";
        dns = [ "192.168.178.254" ];
        dhcpV4Config = {
          UseDomains = true;
        };
      networkConfig = {
        IPv6AcceptRA="no";
        MulticastDNS=true;
      };
    };
    haos = {
      matchConfig.Name = "haos";
      address = [
        "fc00::3/120"
        "10.200.200.30/24"
      ];
      DHCP = "no";
      dns = [ "10.200.200.1" "fc00::1" ];
      gateway = [
        "fc00::1"
        "10.200.200.1"
      ];
      networkConfig = {
        IPv6AcceptRA = false;
      };
    };
  };
  # haos (wireguard)
  sops.secrets = {
    "psk_wg/mowteng" = { };
    "wg/mowteng" = { };
  };
  systemd.network = {
    netdevs = {
      "10-haos" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "haos";
          MTUBytes = "1300";
        };
        wireguardConfig = {
          PrivateKeyFile = config.sops.secrets."wg/mowteng".path;
          ListenPort = 9918;
        };
        wireguardPeers = [{
          wireguardPeerConfig = {
            PublicKey = "CbRmUgGLZuw0Hj7uYFK4aetwePTSzMQEwNsLibFQOX4=";
            PresharedKeyFile = config.sops.secrets."psk_wg/mowteng".path;
            AllowedIPs = [ "fc00::1/64" "10.200.200.1" ];
            Endpoint = "home.fishoeder.net:51871";
          };
        }];
      };
    };
  };
}
