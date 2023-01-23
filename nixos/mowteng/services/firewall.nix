{
  networking.firewall = {
    trustedInterfaces = [ "calvin" "wlp3s0" "wlan0" ];
    allowedUDPPortRanges = [{ # kdeconnect
      from = 1714;
      to = 1764;
    }];

    allowedTCPPorts = [ 5201 27036 ];
    allowedTCPPortRanges = [
      { # kdeconnect
        from = 1714;
        to = 1764;
      }
      {
        from = 27031;
        to = 27036;
      }
    ];
  };
}
