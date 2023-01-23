{
  networking.firewall = {
    trustedInterfaces = [ "calvin" "wlan0" ];
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
