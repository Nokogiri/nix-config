{ pkgs, ... }: {
  networking.networkmanager = {
    #wifi.backend = "iwd";
    enable = true;
    logLevel = "ERR";
  };
  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
