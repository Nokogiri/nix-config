{ config, ... }: {
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
      dhcpV4Config = { UseDomains = true; };
      networkConfig = {
        IPv6AcceptRA = "no";
        MulticastDNS = true;
      };
    };
    haos = {
      matchConfig.Name = "haos";
      address = [ "fc00::3/120" "10.200.200.30/24" ];
      DHCP = "no";
      dns = [ "10.200.200.1" "fc00::1" ];
      routes = [{
        routeConfig = {
          Destination = "10.200.200.0/24";
          Scope = "link";
        };
      }];
      networkConfig = { IPv6AcceptRA = false; };
    };
  };
  # haos (wireguard)
  sops.secrets = {
    "psk_wg/mowteng" = { owner = config.users.users.systemd-network.name; };
    "wg/mowteng" = { owner = config.users.users.systemd-network.name; };
  };
  systemd.network = {
    netdevs = {
      "10-haos" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "haos";
        };
        wireguardConfig = {
          PrivateKeyFile = config.sops.secrets."wg/mowteng".path;
          ListenPort = 51872;
        };
        wireguardPeers = [{
          wireguardPeerConfig = {
            PublicKey = "FgmfBFZw9gQ7NjJJq4hoZty7BYltQHdOcZDPxHiycAs=";
            PresharedKeyFile = config.sops.secrets."psk_wg/mowteng".path;
            AllowedIPs = [ "fc00::/64" "10.200.200.0/24" ];
            PersistentKeepalive = 25;
            Endpoint = "home.fishoeder.net:51871";
          };
        }];
      };
    };
  };
}
