{ config, pkgs, lib, ... }:

{
  sops.secrets = {
    "psk_wg/mowteng" = { };
    "wg/mowteng" = { };
  };

  networking.wireguard.interfaces = {
    haos = {
      ips = [ "10.200.200.30/24" ];
      privateKeyFile = config.sops.secrets."wg/mowteng".path;
    };
  };

  systemd.network.networks."90-wireguard" = {
    matchConfig.Name = "haos";
    address = [ "10.200.200.30/24" ];
    dns = [ "10.200.200.1" ];
    routes = [{
      routeConfig = {
        Destination = "10.200.200.0/24";
        Scope = "link";
      };
    }];
  };
}
