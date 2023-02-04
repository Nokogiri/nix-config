{ pkgs, ... }: {
  networking.networkmanager = {
    wifi.backend = "iwd";
    wifi.powersave = true;
    enable = true;
    logLevel = "ERR";
  };
  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
