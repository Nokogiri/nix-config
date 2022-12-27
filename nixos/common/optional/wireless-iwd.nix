{
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Network = { EnableIPv6 = false; };
      Settings = { AutoConnect = true; };
    };
  };
}
