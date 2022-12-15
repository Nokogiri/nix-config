{
  sops.secrets."wg_private/mowteng" = {
    sopsFile = ../../common/secrets.yaml;
    neededForUsers = true;
  };
  sops.secrets."wg_psk/mowteng" = {
    sopsFile = ../../common/secrets.yaml;
    neededForUsers = true;
  };
  systemd.network.netdevs."90-wireguard" = {
    netdevConfig = {
      Kind = "wireguard";
      Name = "wg0";
    };
    wireguardConfig = {
      PrivateKeyFile = config.sops.secrets."wg/private".path;
      ListenPort = 51872;
    };
    wireguardPeers = [{
      wireguardPeerConfig = {
        AllowedIPs = [ "10.200.200.0/24" "::/1" ];
        Endpoint = "46.38.240.252:51871";
        PersistentKeepalive = 25;
        PresharedKeyFile = config.sops.secrets."wg/psk".path;
        PublicKey = "IqYGE/5SPmMPEs0us6ZkH5RlePZ2KJDpGxBgjCBnQno=";
      };
    }];
  };
  systemd.network.networks."90-wireguard" = {
    matchConfig.Name = "wg0";
    address = [ "10.200.200.3/24" ];
    dns = [ "10.200.200.1" ];
    routes = [{
      routeConfig = {
        Destination = "10.200.200.0/24";
        Scope = "link";
      };
    }];
  };
}
