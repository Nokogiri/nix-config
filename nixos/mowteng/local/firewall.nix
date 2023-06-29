{
  networking.firewall = {
    trustedInterfaces = [ "calvin" "wlp3s0" "wlan0" "haos" ];
    allowedUDPPortRanges = [{ # kdeconnect
      from = 1714;
      to = 1764;
    }];

    allowedTCPPorts = [ 5201 27036 6969 27015 ];
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
