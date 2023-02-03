{ config, pkgs, lib, ... }:

{
  sops.secrets = {
    wg_private = { };
    "wg_psk/consolero" = { };
    "wg_psk/frankenbook" = { };
    "wg_psk/hassio" = { };
    "wg_psk/kathi" = { };
    "wg_psk/mowteng" = { };
    "wg_psk/mrpig" = { };
    "wg_psk/sm-af530" = { };
  };

  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = { allowedUDPPorts = [ 51871 ]; };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.200.200.1/24" ];
      listenPort = 51871;
      privateKeyFile = config.sops.secrets.wg_private.path;

      peers = [
        {
          # consolero
          allowedIPs = [ "10.200.200.5/32" "10.200.200.0/24" ];
          publicKey = "ayew5N9nQFBl25vJHg5DOwOzVQAmJ2DS6wghNAwqtCg=";
          presharedKeyFile = config.sops.secrets."wg_psk/consolero".path;
        }
        {
          # frankenbook
          allowedIPs = [ "10.200.200.2/32" "10.200.200.0/24" ];
          publicKey = "40RkpFdcTlk+AWc9XC/yhWsnwDJKIhEY7t5z3meFJkQ=";
          presharedKeyFile = config.sops.secrets."wg_psk/frankenbook".path;
        }
        {
          # mowteng
          allowedIPs = [ "10.200.200.3/32" "10.200.200.0/24" ];
          publicKey = "PIofiSw2cfcn23NlGC6uJocthPIJqwXB6dUnh4fWwhY=";
          presharedKeyFile = config.sops.secrets."wg_psk/mowteng".path;
        }
        {
          # hassio
          allowedIPs = [ "10.200.200.6/32" "10.200.200.0/24" ];
          publicKey = "o0kQD7EjWYwU6rtDmLjVNy9f5IAfKk1HNRMnY6axNRw=";
          presharedKeyFile = config.sops.secrets."wg_psk/hassio".path;
        }
        {
          # kathi
          allowedIPs = [ "10.200.200.4/32" "10.200.200.0/24" ];
          publicKey = "KH6v0VRW9o4bzfnE1IRI6/e7lAlU52SkKCp22SXon2Y=";
          presharedKeyFile = config.sops.secrets."wg_psk/kathi".path;
        }
        {
          # mrpig
          allowedIPs = [ "10.200.200.7/32" "10.200.200.0/24" ];
          publicKey = "IqH0Yscrwv3QfQIiuK2v2QGHJDQEtYvSbLYX2alh3Fs=";
          presharedKeyFile = config.sops.secrets."wg_psk/mrpig".path;
        }
        {
          # sm-af530
          allowedIPs = [ "10.200.200.10/32" "10.200.200.0/24" ];
          publicKey = "olauwI++R95O0gucWSPDO9uH2/ufv2AvzAsVsUQ9Jl4=";
          presharedKeyFile = config.sops.secrets."wg_psk/sm-af530".path;
        }
      ];
    };
  };
}

