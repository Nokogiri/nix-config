{ pkgs, config, ... }: {

  #networking.firewall.allowedUDPPorts = [ 5353 ];
  services.avahi = {
    enable = true;
    #interfaces = [ "wlan0" ];
    hostName = "${config.networking.hostName}";
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
  environment.etc."avahi/services/smb.service".text = ''
    <?xml version="1.0" standalone="no"?>
    <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
    <service-group>
      <name replace-wildcards="yes">%h</name> ## Display Name
      <service>
          <type>_smb._tcp</type>
          <port>445</port>
      </service>
    </service-group>
  '';
}
