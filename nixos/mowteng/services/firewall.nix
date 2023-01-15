{
  networking.firewall = {
    trustedInterfaces = [ "calvin" "wlp3s0" ];
    allowedUDPPortRanges = [{ # kdeconnect
      from = 1714;
      to = 1764;
    }];

    allowedTCPPorts = [ 5201 ];
    allowedTCPPortRanges = [{ # kdeconnect
      from = 1714;
      to = 1764;
    }];
  };
}
