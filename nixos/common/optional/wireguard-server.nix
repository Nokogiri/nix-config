{ config, pkgs, lib, ... }:

{
  #sops.defaultSopsFile = ../../common/secrets.yaml;
  sops.secrets = {
    "wg/homeassistant" = { };
    "psk_wg/showxating" = { };
    "psk_wg/kipad" = { };
    "psk_wg/kiphone" = { };
    "psk_wg/mowteng" = { };
    "psk_wg/dewalt" = { };
  };

  networking.nat.enable = true;
  networking.nat.externalInterface = "enp1s0f0";
  networking.nat.internalInterfaces = [ "haos" ];
  networking.firewall = { allowedUDPPorts = [ 51871 ]; };

  networking.wireguard.interfaces = {
    haos = {
      ips = [ "10.200.200.1/24" "fc00::1/120" ];
      listenPort = 51871;
      privateKeyFile = config.sops.secrets."wg/homeassistant".path;

      peers = [
        {
          # mowteng
          allowedIPs =
            [ "10.200.200.30/32" "10.200.200.0/24" "fc00::3" "fc00::1/64" ];
          publicKey = "CbRmUgGLZuw0Hj7uYFK4aetwePTSzMQEwNsLibFQOX4=";
          presharedKeyFile = config.sops.secrets."psk_wg/mowteng".path;
        }
        {
          # showxating
          allowedIPs = [ "10.200.200.31/32" "10.200.200.0/24" ];
          publicKey = "/akEJ+EEVS5MBB4apmu7XT+seuT8YsuG31reUujqsRg=";
          presharedKeyFile = config.sops.secrets."psk_wg/showxating".path;
        }
        {
          # kipad
          allowedIPs = [ "10.200.200.32/32" "10.200.200.0/24" ];
          publicKey = "UXb5RaWG2lVlN13mszJMcSHhP6YZdqG+mnHRCE9zcXg=";
          presharedKeyFile = config.sops.secrets."psk_wg/kipad".path;
        }
        {
          # kiphone
          allowedIPs = [ "10.200.200.33/32" "10.200.200.0/24" ];
          publicKey = "pmkcv8JpotbPo+XsIMB3HDxBVqET4YsRJJVAdT2NR3w=";
          presharedKeyFile = config.sops.secrets."psk_wg/kiphone".path;
        }
        {
          # dewalt/sm-af530
          allowedIPs = [ "10.200.200.34/32" "10.200.200.0/24" ];
          publicKey = "6EM5RLfTCZGrFl1tW1oMiaLetrmblj6oqOXQa4J1ZF8=";
          presharedKeyFile = config.sops.secrets."psk_wg/dewalt".path;
        }
      ];
    };
  };
}

