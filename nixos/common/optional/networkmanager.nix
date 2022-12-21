{ pkgs, ... }:{
  networking.networkmanager = {
    enable = true;
    logLevel = "ERR";
  };
  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];
}
