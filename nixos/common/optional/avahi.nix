{ pkgs, config, ... }: {

  networking.firewall.allowedUDPPorts = [ 5353 ];
  services.avahi = {
    enable = true;
    hostName = config.networking.hostName;
    extraServiceFiles = {
      ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
    };
    nssmdns = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      hinfo = true;
      userServices = true;
    };
  };
}
