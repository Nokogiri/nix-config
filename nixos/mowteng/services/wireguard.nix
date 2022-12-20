{ config, ... }: {
  sops.secrets."wg_private/mowteng" = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.systemd-network.name;
  };
  sops.secrets."wg_psk/mowteng" = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.systemd-network.name;
  };
  networking.firewall = {
    allowedUDPPorts = [ 51872 ];
    trustedInterfaces = [ "wg0" ];
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.200.200.3/24" ];
      listenPort = 51872;
      privateKeyFile = config.sops.secrets."wg_private/mowteng".path;

      peers = [{
        publicKey = "IqYGE/5SPmMPEs0us6ZkH5RlePZ2KJDpGxBgjCBnQno=";
        allowedIPs = [ "10.200.200.0/24" ];
        endpoint = "46.38.240.252:51871";
        presharedKeyFile = config.sops.secrets."wg_psk/mowteng".path;
        persistentKeepalive = 25;
      }];
    };
  };
}
