{
  networking.firewall = {
    trustedInterfaces = [ "wg0" "enp1s0f0" ];
    allowedTCPPorts = [ 80 443 5353 6052 8123 ];
    allowedUDPPortRanges = [{ # kdeconnect
      from = 1714;
      to = 1764;
    }];

    allowedTCPPortRanges = [{ # kdeconnect
      from = 1714;
      to = 1764;
    }];
  };
}
