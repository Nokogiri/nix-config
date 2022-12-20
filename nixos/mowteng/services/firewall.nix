{
  networking.firewall = {
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
