{ config, pkgs, lib, ... }:

{
  services = {
    #qemuGuest.enable = true;
    #jellyfin.enable = true;
    transmission = {
      enable = true;
      user = "nokogiri";
      openPeerPorts = true;
      credentialsFile = "/var/lib/secrets/transmission/settings.json";
      settings = { rpc-bind-address = "10.200.200.1"; };
    };
  };
}

