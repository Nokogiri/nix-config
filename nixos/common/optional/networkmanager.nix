{ pkgs, ... }: {
  networking.networkmanager = {
    wifi.backend = "iwd";
    wifi.powersave = false;
    enable = true;
    logLevel = "ERR";
  };
  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
